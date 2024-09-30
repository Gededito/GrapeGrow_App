import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_hama_route_datasource.dart';

part 'delete_sebaran_hama_bloc.freezed.dart';
part 'delete_sebaran_hama_event.dart';
part 'delete_sebaran_hama_state.dart';

class DeleteSebaranHamaBloc extends Bloc<DeleteSebaranHamaEvent, DeleteSebaranHamaState> {
  DeleteSebaranHamaBloc(SebaranHamaRouteDatasource sebaranHamaRouteDatasource) : super(const _Initial()) {
    on<_DeleteSebaranHama>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranHamaRouteDatasource.deleteSebaranHama(event.id);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
