import 'package:article_recommendation_system/core/common/entities/user_tag.dart';
import 'package:article_recommendation_system/core/error/exceptions.dart';
import 'package:article_recommendation_system/core/error/failures.dart';
import 'package:article_recommendation_system/features/articles/data/datasource/supabase_database_tags.dart';
import 'package:article_recommendation_system/features/articles/domain/repositories/user_tag_repository.dart';
import 'package:article_recommendation_system/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class UserTagRepositoryImpl implements UserTagRepository {
  final SupabaseDatabaseTags tagRemoteDataSource;
  UserTagRepositoryImpl(this.tagRemoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await tagRemoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('Uzytkownik nie zalogowany'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<UserTag>>> downloadUserTags() async {
    try {
      final userTags = await tagRemoteDataSource.downloadUserTags();
      return right(userTags);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserTag>> uploadUserTags(
      {required String userId, required String tagId}) {
    // TODO: implement uploadUserTags
    throw UnimplementedError();
  }

  Future<Either<Failure, UserTag>> _getUserTags(
    Future<UserTag> Function() fn,
  ) async {
    try {
      final userTag = await fn();
      return right(userTag);
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
