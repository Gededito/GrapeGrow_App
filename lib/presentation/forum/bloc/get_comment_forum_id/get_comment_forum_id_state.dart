part of 'get_comment_forum_id_bloc.dart';

@freezed
class GetCommentForumIdState with _$GetCommentForumIdState {
  const factory GetCommentForumIdState.initial() = _Initial;
  const factory GetCommentForumIdState.loading() = _Loading;
  const factory GetCommentForumIdState.error(String message) = _Error;
  const factory GetCommentForumIdState.success(GetCommentByIdForumResponse getCommentForumResponse) = _Success;
}
