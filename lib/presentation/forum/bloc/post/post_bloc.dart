import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/forum_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/request/post_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/forum/add_post_forum_response_model.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  PostBloc(ForumRemoteDatasource forumRemoteDatasource) : super(const _Initial()) {
    on<_PostForum>((event, emit) async {
      emit(const _Loading());

      final response = await forumRemoteDatasource.createPost(event.data);
      
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
