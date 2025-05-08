import 'dart:developer';
import 'dart:io';

import 'package:article_recommendation_system/core/error/exceptions.dart';
import 'package:article_recommendation_system/features/articles/data/models/article_model.dart';
import 'package:article_recommendation_system/features/articles/domain/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(mongoConnUrl);
    await db.open();
    inspect(db);
    userCollection = db.collection(userCollectionName);
    print(await userCollection.find().toList());
  }
}

abstract interface class ArticleRemoteDataSouce {
  Future<ArticleModel> uploadArticle(ArticleModel artticle);
  Future<String> uploadArticleImage(
      {required File image, required ArticleModel article});
}

class ArticleRemoteDataSouceImpl implements ArticleRemoteDataSouce {
  final SupabaseClient supabaseClient;
  ArticleRemoteDataSouceImpl(this.supabaseClient);
  @override
  Future<ArticleModel> uploadArticle(ArticleModel article) async {
    try {
      final articleData =
          await supabaseClient.from('articles').insert(article.toJson);
      return ArticleModel.fromJson(articleData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadArticleImage(
      {required File image, required ArticleModel article}) async {
    try {
      await supabaseClient.storage
          .from('article_images')
          .upload(article.id, image);
      return supabaseClient.storage
          .from('article_image')
          .getPublicUrl(article.id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
