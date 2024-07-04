import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/hama_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/hama_response_model.dart';

part 'hama_bloc.freezed.dart';
part 'hama_event.dart';
part 'hama_state.dart';

class HamaBloc extends Bloc<HamaEvent, HamaState> {

  final HamaRemoteDatasource hamaRemoteDatasource;

  HamaBloc(this.hamaRemoteDatasource) : super(const _Initial()) {
    on<HamaEvent>((event, emit) async {

      emit(const HamaState.loading());
      
      final response = await hamaRemoteDatasource.getAllHama();

      response.fold(
        (l) => emit(HamaState.error(l)),
        (r) => emit(HamaState.success(r))
      );

    });
  }
}
