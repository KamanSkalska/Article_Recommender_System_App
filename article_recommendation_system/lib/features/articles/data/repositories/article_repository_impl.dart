import 'dart:io';

import 'package:article_recommendation_system/core/error/exceptions.dart';
import 'package:article_recommendation_system/core/error/failures.dart';
import 'package:article_recommendation_system/features/articles/data/models/article_model.dart';
import 'package:article_recommendation_system/features/articles/domain/dbHelper/connect.dart';
import 'package:article_recommendation_system/features/articles/domain/entities/article.dart';
import 'package:article_recommendation_system/features/articles/domain/repositories/article_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSouce articleRemoteDataSouce;
  ArticleRepositoryImpl(this.articleRemoteDataSouce);

  @override
  Future<Either<Failure, Article>> uploadArticle(
      {required File image,
      required String title,
      required String author,
      required String date,
      required String description,
      required List<String> tags}) async {
    try {
      ArticleModel articleModel = ArticleModel(
          id: const Uuid().v1(),
          title: title,
          author: author,
          date: date,
          description: description,
          tags: tags);
      //final imageUrl = await articleRemoteDataSouce.uploadArticleImage(
      //   image: image, article: articleModel);
      final uploadedArticle =
          await articleRemoteDataSouce.uploadArticle(articleModel);
      return right(uploadedArticle);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
