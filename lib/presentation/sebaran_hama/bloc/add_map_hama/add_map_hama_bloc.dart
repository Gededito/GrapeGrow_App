import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/map_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/maps/map_model.dart';

part 'add_map_hama_bloc.freezed.dart';
part 'add_map_hama_event.dart';
part 'add_map_hama_state.dart';

class AddMapHamaBloc extends Bloc<AddMapHamaEvent, AddMapHamaState> {
  final MapRemoteDataSource mapRemoteDataSource;

  AddMapHamaBloc(this.mapRemoteDataSource) : super(const _Initial()) {
    on<GetCurrentPosition>(_onGetCurrentPosition);
    on<GetSelectedPosition>(_onGetSelectedPosition);
    on<SetInitial>(_onSetInitial);
    on<SetValue>(_onSetValue);
  }

  Future<void> _onGetCurrentPosition(GetCurrentPosition event, Emitter<AddMapHamaState> emit) async {
    emit(const _Loading());
    final result = await mapRemoteDataSource.getCurrentPosition();
    result.fold(
      (l) => emit(_Error(l)),
      (r) => emit(_Loaded(r)),
    );
  }

  Future<void> _onGetSelectedPosition(GetSelectedPosition event, Emitter<AddMapHamaState> emit) async {
    emit(const _Loading());
    final result = await mapRemoteDataSource.getPosition(lat: event.lat, long: event.lon);
    result.fold(
      (l) => emit(_Error(l)),
      (r) => emit(_Loaded(r)),
    );
  }

  void _onSetInitial(SetInitial event, Emitter<AddMapHamaState> emit) {
    emit(const _Initial());
  }

  void _onSetValue(SetValue event, Emitter<AddMapHamaState> emit) {
    emit(_Loaded(event.data));
  }

}
