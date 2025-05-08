import 'dart:io';

import 'package:article_recommendation_system/features/articles/domain/usecases/upload_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final UploadArticle uploadArticle;
  ArticleBloc(this.uploadArticle) : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) => emit(ArticleLoading()));
    on<ArticleUpload>(_onArticleUpload);
  }
  void _onArticleUpload(ArticleUpload event, Emitter<ArticleState> emit) async {
    final res = await uploadArticle(UploadArticleParams(
        image: event.image,
        title: event.title,
        postedId: event.postedId,
        author: event.author,
        date: event.date,
        description: event.description,
        tags: event.tags));
    res.fold(
        (l) => emit(ArticleFailure(l.message)), (r) => emit(ArticleSuccess()));
  }
}
