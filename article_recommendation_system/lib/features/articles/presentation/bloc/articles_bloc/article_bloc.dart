import 'dart:io';

import 'package:article_recommendation_system/features/articles/domain/usecases/download_articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:article_recommendation_system/features/articles/domain/entities/article.dart';
import 'package:article_recommendation_system/features/articles/domain/usecases/upload_article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase getArticles;
  final UploadArticle uploadArticle;

  ArticleBloc({
    required this.getArticles,
    required this.uploadArticle,
  }) : super(ArticleInitial()) {
    on<FetchArticles>(_onFetchArticles);
    on<UploadArticleEvent>(_onUploadArticle);
  }

  void _onFetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    final res = await getArticles();
    res.fold(
      (failure) => emit(ArticleFailure(failure.message)),
      (articles) => emit(ArticleListLoaded(articles)),
    );
  }

  void _onUploadArticle(
      UploadArticleEvent event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());

    final res = await uploadArticle(UploadArticleParams(
      image: event.image,
      title: event.title,
      postedId: event.postedId,
      author: event.author,
      date: event.date,
      description: event.description,
      tags: event.tags,
      body: event.body,
    ));

    res.fold(
      (failure) => emit(ArticleFailure(failure.message)),
      (_) => emit(ArticleUploadSuccess()),
    );
  }
}
