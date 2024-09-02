import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/modul_budidaya_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/modul/get_all_modul_response.dart';

part 'get_all_modul_bloc.freezed.dart';
part 'get_all_modul_event.dart';
part 'get_all_modul_state.dart';

class GetAllModulBloc extends Bloc<GetAllModulEvent, GetAllModulState> {

  final ModulBudidayaRemoteDatasource modulBudidayaRemoteDatasource;

  GetAllModulBloc(this.modulBudidayaRemoteDatasource) : super(const _Initial()) {
    on<GetAllModulEvent>((event, emit) async {

      emit(const _Loading());

      final response = await modulBudidayaRemoteDatasource.getAllModul();
      // print(response);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
