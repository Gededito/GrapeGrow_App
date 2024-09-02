import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/forum_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/forum/get_comment_id_forum_response_model.dart';

part 'get_comment_forum_id_bloc.freezed.dart';
part 'get_comment_forum_id_event.dart';
part 'get_comment_forum_id_state.dart';

class GetCommentForumIdBloc extends Bloc<GetCommentForumIdEvent, GetCommentForumIdState> {
  
  GetCommentForumIdBloc(ForumRemoteDatasource forumRemoteDatasource) : super(const _Initial()) {
    on<_GetCommentByIdForum>((event, emit) async {
      emit(const _Loading());

      try {
        final response = await ForumRemoteDatasource().getCommentByIdForum(event.id);

        response.fold(
              (l) => emit(_Error(l)),
              (r) => emit(_Success(r)),
        );
      } catch (e) {
        print(_Error(e.toString()));
      }

    });
  }
}
