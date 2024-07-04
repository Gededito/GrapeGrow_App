import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_varietas_route_datasource.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_varietas_request.dart';
import 'package:grapegrow_apps/data/models/responses/add_sebaran_varietas_response.dart';

part 'add_sebaran_varietas_bloc.freezed.dart';
part 'add_sebaran_varietas_event.dart';
part 'add_sebaran_varietas_state.dart';

class AddSebaranVarietasBloc extends Bloc<AddSebaranVarietasEvent, AddSebaranVarietasState> {

  AddSebaranVarietasBloc(SebaranVarietasRouteDatasource sebaranVarietasRouteDatasource) : super(const _Initial()) {
    on<_AddSebaranVarietas>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranVarietasRouteDatasource.addSebaranVarietas(event.data);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
