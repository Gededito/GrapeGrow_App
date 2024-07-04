part of 'add_map_hama_bloc.dart';

@freezed
class AddMapHamaEvent with _$AddMapHamaEvent {
  const factory AddMapHamaEvent.getSelectedPosition({
    required double lat,
    required double lon,
  }) = GetSelectedPosition;
  const factory AddMapHamaEvent.getCurrentPosition() = GetCurrentPosition;
  const factory AddMapHamaEvent.setInitial() = SetInitial;
  const factory AddMapHamaEvent.setValue({required MapModel data}) = SetValue;
}