class UserTag {
  final String id;
  final String userId;
  final String tagId;
  final String? tagName;

  UserTag({
    required this.id,
    required this.userId,
    required this.tagId,
    this.tagName,
  });
}
