import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_varietas_route_datasource.dart';

part 'delete_sebaran_varietas_bloc.freezed.dart';
part 'delete_sebaran_varietas_event.dart';
part 'delete_sebaran_varietas_state.dart';

class DeleteSebaranVarietasBloc extends Bloc<DeleteSebaranVarietasEvent, DeleteSebaranVarietasState> {
  DeleteSebaranVarietasBloc(SebaranVarietasRouteDatasource sebaranVarietasRouteDatasource) : super(const _Initial()) {
    on<_DeleteSebaranVarietas>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranVarietasRouteDatasource.deleteSebaranVarietas(event.id);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r))
      );
    });
  }
}
