part of 'add_map_varietas_bloc.dart';

@freezed
class AddMapVarietasEvent with _$AddMapVarietasEvent {
  const factory AddMapVarietasEvent.started() = _Started;
  const factory AddMapVarietasEvent.getSelectedPosition({
    required double lat,
    required double lon,
  }) = GetSelectedPosition;
  const factory AddMapVarietasEvent.getCurrentPosition() = GetCurrentPosition;
  const factory AddMapVarietasEvent.setInitial() = SetInitial;
  const factory AddMapVarietasEvent.setValue({required MapModel data}) = SetValue;
}