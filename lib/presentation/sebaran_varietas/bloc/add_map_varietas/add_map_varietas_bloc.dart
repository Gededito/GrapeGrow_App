import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/map_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/maps/map_model.dart';

part 'add_map_varietas_bloc.freezed.dart';
part 'add_map_varietas_event.dart';
part 'add_map_varietas_state.dart';

class AddMapVarietasBloc extends Bloc<AddMapVarietasEvent, AddMapVarietasState> {
  final MapRemoteDataSource mapRemoteDataSource;

  AddMapVarietasBloc(this.mapRemoteDataSource) : super(const _Initial()) {
    on<GetCurrentPosition>(_onGetCurrentPosition);
    on<GetSelectedPosition>(_onGetSelectedPosition);
    on<SetInitial>(_onSetInitial);
    on<SetValue>(_onSetValue);
  }

  Future<void> _onGetCurrentPosition(GetCurrentPosition event, Emitter<AddMapVarietasState> emit) async {
    emit(const _Loading());
    final result = await mapRemoteDataSource.getCurrentPosition();
    result.fold(
      (l) => emit(_Error(l)),
      (r) => emit(_Loaded(r)),
    );
  }

  Future<void> _onGetSelectedPosition(GetSelectedPosition event, Emitter<AddMapVarietasState> emit) async {
    emit(const _Loading());
    final result = await mapRemoteDataSource.getPosition(lat: event.lat, long: event.lon);
    result.fold(
      (l) => emit(_Error(l)),
      (r) => emit(_Loaded(r)),
    );
  }

  void _onSetInitial(SetInitial event, Emitter<AddMapVarietasState> emit) {
    emit(const _Initial());
  }

  void _onSetValue(SetValue event, Emitter<AddMapVarietasState> emit) {
    emit(_Loaded(event.data));
  }
}
