import 'package:article_recommendation_system/features/articles/domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel(
      {required super.id,
      required super.title,
      required super.author,
      required super.date,
      required super.description,
      required super.tags});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      date: json['date'] as String,
      description: json['description'] as String,
      tags: List<String>.from(json['tags'] as List<String>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'date': date,
      'description': description,
      'tags': tags,
    };
  }
}
