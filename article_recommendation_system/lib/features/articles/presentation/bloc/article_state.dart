part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {}

final class ArticleFailure extends ArticleState {
  final String error;
  ArticleFailure(this.error);
}

final class ArticleSuccess extends ArticleState {}
