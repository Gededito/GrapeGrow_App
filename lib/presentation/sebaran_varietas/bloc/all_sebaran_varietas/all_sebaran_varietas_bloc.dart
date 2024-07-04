import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_varietas_route_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/list_sebaran_varietas_response.dart';

part 'all_sebaran_varietas_bloc.freezed.dart';
part 'all_sebaran_varietas_event.dart';
part 'all_sebaran_varietas_state.dart';

class AllSebaranVarietasBloc extends Bloc<AllSebaranVarietasEvent, AllSebaranVarietasState> {

  final SebaranVarietasRouteDatasource sebaranVarietasRemoteDatasource;

  AllSebaranVarietasBloc(this.sebaranVarietasRemoteDatasource) : super(const _Initial()) {
    on<_GetAllSebaranVarietas>((event, emit) async {
      emit(const _Loading());

      final response = await sebaranVarietasRemoteDatasource.getAllSebaranVarietas();

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Succes(r))
      );
    });
  }
}
