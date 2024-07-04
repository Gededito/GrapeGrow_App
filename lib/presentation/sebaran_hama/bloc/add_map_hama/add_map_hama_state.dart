part of 'add_map_hama_bloc.dart';

@freezed
class AddMapHamaState with _$AddMapHamaState {
  const factory AddMapHamaState.initial() = _Initial;
  const factory AddMapHamaState.loading() = _Loading;
  const factory AddMapHamaState.loaded(MapModel data) = _Loaded;
  const factory AddMapHamaState.error(String message) = _Error;
}
