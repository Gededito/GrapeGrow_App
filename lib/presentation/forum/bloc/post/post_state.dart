part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.loading() = _Loading;
  const factory PostState.error(String message) = _Error;
  const factory PostState.success(PostForumResponse postForumResponse) = _Success;
}
