part of 'add_comment_bloc.dart';

@freezed
class AddCommentEvent with _$AddCommentEvent {
  const factory AddCommentEvent.started() = _Started;
  const factory AddCommentEvent.addComment(CommentRequestModel data, String postId) = _AddComment;
}