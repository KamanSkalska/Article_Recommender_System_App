import 'package:article_recommendation_system/core/error/exceptions.dart';
import 'package:article_recommendation_system/features/articles/data/models/user_tag_model.dart';
import 'package:article_recommendation_system/features/auth/data/models/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class SupabaseDatabaseTags {
  Session? get currentUserSession;
  Future<UserModel?> uploadUserTags({
    required String name,
    required String email,
    required String password,
  });
  Future<List<UserTagModel>> downloadUserTags();

  Future<UserModel?> getCurrentUserData();
}

class SupabaseDatabaseTagsImpl implements SupabaseDatabaseTags {
  final SupabaseClient supabaseClient;
  SupabaseDatabaseTagsImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);
        return UserModel.fromJSon(userData.first)
            .copyWith(email: currentUserSession!.user.email);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<UserTagModel>> downloadUserTags() async {
    try {
      final tags =
          await supabaseClient.from('user_tags').select('*,tags(type)');
      return tags
          .map((tag) => UserTagModel.fromJSon(tag).copyWith(
                tagName: tag['tags']['type'],
              ))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
    /*
      if (currentUserSession != null) {
        final tagData = await supabaseClient
            .from('user_tags')
            .select()
            .eq('user_id', currentUserSession!.user.id);
        print(tagData);
        return UserTagModel.fromJSon(tagData.first);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }*/
  }

  @override
  Future<UserModel?> uploadUserTags(
      {required String name, required String email, required String password}) {
    // TODO: implement uploadUserTags
    throw UnimplementedError();
  }
}
