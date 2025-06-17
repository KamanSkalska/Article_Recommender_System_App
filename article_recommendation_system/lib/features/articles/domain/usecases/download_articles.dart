import 'package:fpdart/fpdart.dart';
import '../entities/article.dart';
import '../repositories/article_repository.dart';
import '../../../../core/error/failures.dart';

class GetArticlesUseCase {
  final ArticleRepository repository;

  GetArticlesUseCase(this.repository);

  Future<Either<Failure, List<Article>>> call() async {
    return await repository.getAllArticles();
  }
}
