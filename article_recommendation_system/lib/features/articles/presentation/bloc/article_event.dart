part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}

final class ArticleUpload extends ArticleEvent {
  final File image;
  final String title;
  final String postedId;
  final String author;
  final String date;
  final String description;
  final List<String> tags;

  ArticleUpload(
      {required this.image,
      required this.title,
      required this.postedId,
      required this.author,
      required this.date,
      required this.description,
      required this.tags});
}
