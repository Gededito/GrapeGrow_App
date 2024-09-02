import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/modul_budidaya_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/modul/get_video_modul_id_response.dart';

part 'get_modul_by_id_bloc.freezed.dart';
part 'get_modul_by_id_event.dart';
part 'get_modul_by_id_state.dart';

class GetModulByIdBloc extends Bloc<GetModulByIdEvent, GetModulByIdState> {

  final ModulBudidayaRemoteDatasource modulBudidayaRemoteDatasource;

  GetModulByIdBloc(this.modulBudidayaRemoteDatasource) : super(const _Initial()) {
    on<_GetModulById>((event, emit) async {
      emit(const _Loading());

      final response = await modulBudidayaRemoteDatasource.getVideoModulById(event.id);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }

}
