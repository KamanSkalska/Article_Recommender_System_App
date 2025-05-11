part of 'article_bloc.dart';

@immutable
sealed class UserTagState {}

final class ArticleInitial extends UserTagState {}

final class ArticleLoading extends UserTagState {}

final class ArticleFailure extends UserTagState {
  final String error;
  ArticleFailure(this.error);
}

final class ArticleDisplaySuccess extends UserTagState {
  final List<UserTag> userTags;
  ArticleDisplaySuccess(this.userTags);
}

final class ArticleUploadSuccess extends UserTagState {}
