part of 'add_sebaran_hama_bloc.dart';

@freezed
class AddSebaranHamaEvent with _$AddSebaranHamaEvent {
  const factory AddSebaranHamaEvent.started() = _Started;
  const factory AddSebaranHamaEvent.addSebaran(SebaranHamaRequest data) = _AddSebaranHama;
}