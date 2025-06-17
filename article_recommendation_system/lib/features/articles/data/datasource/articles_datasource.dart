import 'dart:convert';

import 'package:article_recommendation_system/core/error/exceptions.dart';
import 'package:article_recommendation_system/features/articles/data/datasource/dbHelper/constant.dart';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

abstract interface class ArticleRemoteDataSource {
  Future<ArticleModel> uploadArticle(ArticleModel article);
  Future<List<ArticleModel>> getAllArticles();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final http.Client client;
  ArticleRemoteDataSourceImpl(this.client);

  @override
  Future<List<ArticleModel>> getAllArticles() async {
    try {
      final response = await client.get(Uri.parse(NODEJS_URL));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => ArticleModel.fromJson(e)).toList();
      } else {
        throw const ServerException("Failed to fetch articles");
      }
    } catch (e) {
      throw ServerException("HTTP error: ${e.toString()}");
    }
  }

  @override
  Future<ArticleModel> uploadArticle(ArticleModel article) {
    // TODO: implement uploadArticle
    throw UnimplementedError();
  }
}
