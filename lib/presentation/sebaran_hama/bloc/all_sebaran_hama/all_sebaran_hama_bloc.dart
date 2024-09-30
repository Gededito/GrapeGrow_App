import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_hama_route_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/list_sebaran_hama_response.dart';

part 'all_sebaran_hama_bloc.freezed.dart';
part 'all_sebaran_hama_event.dart';
part 'all_sebaran_hama_state.dart';

class AllSebaranHamaBloc extends Bloc<AllSebaranHamaEvent, AllSebaranHamaState> {

  final SebaranHamaRouteDatasource sebaranHamaRouteDatasource;

  AllSebaranHamaBloc(this.sebaranHamaRouteDatasource) : super(const _Initial()) {
    on<_GetAllSebaranHama>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranHamaRouteDatasource.getAllSebaranHama();

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Succes(r)),
      );
    });
  }
}
