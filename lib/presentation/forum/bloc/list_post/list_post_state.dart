part of 'list_post_bloc.dart';

@freezed
class ListPostState with _$ListPostState {
  const factory ListPostState.initial() = _Initial;
  const factory ListPostState.loading() = _Loading;
  const factory ListPostState.error(String message) = _Error;
  const factory ListPostState.success(GetAllPostForumResponse data) = _Success;
}
