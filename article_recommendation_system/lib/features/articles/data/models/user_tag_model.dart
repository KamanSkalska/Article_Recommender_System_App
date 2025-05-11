import 'package:article_recommendation_system/core/common/entities/user_tag.dart';

class UserTagModel extends UserTag {
  UserTagModel(
      {required super.id,
      required super.userId,
      required super.tagId,
      super.tagName});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'tagId': tagId,
    };
  }

  factory UserTagModel.fromJSon(Map<String, dynamic> map) {
    return UserTagModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      tagId: map['tagId'] as String,
    );
  }

  UserTagModel copyWith({
    String? id,
    String? userId,
    String? tagId,
    String? tagName,
  }) {
    return UserTagModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      tagId: tagId ?? this.tagId,
      tagName: tagName ?? this.tagName,
    );
  }
}
