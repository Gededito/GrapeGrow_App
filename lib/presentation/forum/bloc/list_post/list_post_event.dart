part of 'list_post_bloc.dart';

@freezed
class ListPostEvent with _$ListPostEvent {
  const factory ListPostEvent.started() = _Started;
  const factory ListPostEvent.getAllPost() = _GetAllPostForum;
}