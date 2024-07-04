import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/varietas_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/varietas_response_model.dart';

part 'varietas_bloc.freezed.dart';
part 'varietas_event.dart';
part 'varietas_state.dart';

class VarietasBloc extends Bloc<VarietasEvent, VarietasState> {

  final VarietasRemoteDatasource varietasRemoteDatasource;

  VarietasBloc(this.varietasRemoteDatasource) : super(const _Initial()) {
    on<VarietasEvent>((event, emit) async {
      emit(const VarietasState.loading());

      final response = await varietasRemoteDatasource.getAllVarietas();

      response.fold(
        (l) => emit(VarietasState.error(l)),
        (r) => emit(VarietasState.success(r)),
      );
    });
  }
}
