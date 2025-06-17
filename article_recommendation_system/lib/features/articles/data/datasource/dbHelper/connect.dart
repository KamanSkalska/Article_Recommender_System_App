/*import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:article_recommendation_system/core/error/exceptions.dart';
import 'package:article_recommendation_system/features/articles/data/models/article_model.dart';

abstract interface class ArticleRemoteDataSouce {
  Future<ArticleModel> uploadArticle(ArticleModel article);
  Future<String> uploadArticleImage({
    required File image,
    required ArticleModel article,
  });
  Future<List<ArticleModel>> getAllArticles();
}

class ArticleRemoteDataSouceImpl implements ArticleRemoteDataSouce {
  final Db db;

  ArticleRemoteDataSouceImpl(this.db);

  @override
  Future<ArticleModel> uploadArticle(ArticleModel article) async {
    try {
      final coll = db.collection('articles');
      await coll.insertOne(article.toJson());
      return article;
    } catch (e) {
      throw ServerException("Mongo insert failed: ${e.toString()}");
    }
  }

  @override
  Future<String> uploadArticleImage({
    required File image,
    required ArticleModel article,
  }) async {
    // Stubbed for now — you can integrate GridFS or external image hosting later
    return 'https://fake-url.com/${article.id}.jpg';
  }

  @override
  Future<List<ArticleModel>> getAllArticles() async {
    try {
      final coll = db.collection('articles');
      final result = await coll.find().toList();
      return result.map((json) => ArticleModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException("Mongo read failed: ${e.toString()}");
    }
  }
}
*/
