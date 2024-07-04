part of 'get_comment_forum_id_bloc.dart';

@freezed
class GetCommentForumIdEvent with _$GetCommentForumIdEvent {
  const factory GetCommentForumIdEvent.started() = _Started;
  const factory GetCommentForumIdEvent.getAllCommentById(String id) = _GetCommentByIdForum;
}