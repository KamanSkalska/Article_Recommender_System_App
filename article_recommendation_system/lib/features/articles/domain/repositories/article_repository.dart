import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:article_recommendation_system/core/error/failures.dart';
import 'package:article_recommendation_system/features/articles/domain/entities/article.dart';

abstract interface class ArticleRepository {
  Future<Either<Failure, Article>> uploadArticle(
      {required File image,
      required String title,
      required String author,
      required String date,
      required String description,
      required List<String> tags});
}
