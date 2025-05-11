import 'package:article_recommendation_system/core/common/entities/user_tag.dart';
import 'package:article_recommendation_system/core/error/failures.dart';
import 'package:article_recommendation_system/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserTagRepository {
  Future<Either<Failure, UserTag>> uploadUserTags({
    required String userId,
    required String tagId,
  });
  Future<Either<Failure, List<UserTag>>> downloadUserTags();

  Future<Either<Failure, User>> currentUser();
}
