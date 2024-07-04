part of 'add_map_varietas_bloc.dart';

@freezed
class AddMapVarietasState with _$AddMapVarietasState {
  const factory AddMapVarietasState.initial() = _Initial;
  const factory AddMapVarietasState.loading() = _Loading;
  const factory AddMapVarietasState.loaded(MapModel data) = _Loaded;
  const factory AddMapVarietasState.error(String message) = _Error;
}
