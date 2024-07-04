import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_hama_route_datasource.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_hama_request.dart';
import 'package:grapegrow_apps/data/models/responses/add_sebaran_hama_response.dart';

part 'add_sebaran_hama_bloc.freezed.dart';
part 'add_sebaran_hama_event.dart';
part 'add_sebaran_hama_state.dart';

class AddSebaranHamaBloc extends Bloc<AddSebaranHamaEvent, AddSebaranHamaState> {
  AddSebaranHamaBloc(
    SebaranHamaRouteDatasource sebaranHamaRemoteDatasource
  ) : super(const _Initial()) {
    on<_AddSebaranHama>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranHamaRemoteDatasource.addSebaranHama(event.data);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
