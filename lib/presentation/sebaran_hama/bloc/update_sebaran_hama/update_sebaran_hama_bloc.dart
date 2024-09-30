import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_hama_route_datasource.dart';
import 'package:grapegrow_apps/data/models/request/update_sebaran_hama.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_hama_response.dart';

part 'update_sebaran_hama_bloc.freezed.dart';
part 'update_sebaran_hama_event.dart';
part 'update_sebaran_hama_state.dart';

class UpdateSebaranHamaBloc extends Bloc<UpdateSebaranHamaEvent, UpdateSebaranHamaState> {
  UpdateSebaranHamaBloc(SebaranHamaRouteDatasource sebaranHamaRouteDatasource) : super(const _Initial()) {
    on<_UpdateSebaranHama>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranHamaRouteDatasource.updateSebaranHama(event.data, event.id);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
