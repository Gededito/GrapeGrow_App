import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_varietas_route_datasource.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_varietas_request.dart';
import 'package:grapegrow_apps/data/models/request/update_sebaran_varietas.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_varietas_response.dart';

part 'update_sebaran_varietas_bloc.freezed.dart';
part 'update_sebaran_varietas_event.dart';
part 'update_sebaran_varietas_state.dart';

class UpdateSebaranVarietasBloc extends Bloc<UpdateSebaranVarietasEvent, UpdateSebaranVarietasState> {
  UpdateSebaranVarietasBloc(SebaranVarietasRouteDatasource sebaranVarietasRouteDatasource) : super(const _Initial()) {
    on<_UpdateSebaranVarietas>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranVarietasRouteDatasource.updateSebaranVarietas(event.data, event.id);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r))
      );
    });
  }
}
