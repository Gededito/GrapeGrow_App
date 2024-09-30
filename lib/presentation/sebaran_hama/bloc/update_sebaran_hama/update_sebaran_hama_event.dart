part of 'update_sebaran_hama_bloc.dart';

@freezed
class UpdateSebaranHamaEvent with _$UpdateSebaranHamaEvent {
  const factory UpdateSebaranHamaEvent.started() = _Started;
  const factory UpdateSebaranHamaEvent.updateSebaranHama(
    UpdateSebaranHama data,
    int id,
  ) = _UpdateSebaranHama;
}