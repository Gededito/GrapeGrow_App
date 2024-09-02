part of 'add_comment_bloc.dart';

@freezed
class AddCommentState with _$AddCommentState {
  const factory AddCommentState.initial() = _Initial;
  const factory AddCommentState.loading() = _Loading;
  const factory AddCommentState.error(String message) = _Error;
  const factory AddCommentState.success(AddCommentByIdForumResponse commentForumResponse) = _Success;
}
