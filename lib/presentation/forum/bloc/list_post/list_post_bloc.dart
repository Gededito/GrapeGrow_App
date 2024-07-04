import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/forum_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/get_post_forum_response_model.dart';

part 'list_post_bloc.freezed.dart';
part 'list_post_event.dart';
part 'list_post_state.dart';

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {

  final ForumRemoteDatasource forumRemoteDatasource;

  ListPostBloc(this.forumRemoteDatasource) : super(const _Initial()) {
    on<ListPostEvent>((event, emit) async {
      emit(const ListPostState.loading());

      final response = await forumRemoteDatasource.getAllPost();
      
      response.fold(
        (l) => emit(ListPostState.error(l)),
        (r) => emit(ListPostState.success(r))
      );
    });
  }
}
