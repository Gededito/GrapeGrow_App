import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/forum_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/request/comment_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/comment_forum_response.dart';

part 'add_comment_bloc.freezed.dart';
part 'add_comment_event.dart';
part 'add_comment_state.dart';

class AddCommentBloc extends Bloc<AddCommentEvent, AddCommentState> {

  AddCommentBloc(ForumRemoteDatasource forumRemoteDatasource) : super(const _Initial()) {
    on<_AddComment>((event, emit) async {
      emit(const _Loading());

      final response = await ForumRemoteDatasource().createCommentByIdForum(event.data, event.postId);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
