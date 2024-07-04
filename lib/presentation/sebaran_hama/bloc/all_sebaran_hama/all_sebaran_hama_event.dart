part of 'all_sebaran_hama_bloc.dart';

@freezed
class AllSebaranHamaEvent with _$AllSebaranHamaEvent {
  const factory AllSebaranHamaEvent.started() = _Started;
  const factory AllSebaranHamaEvent.getAllSebaran() = _GetAllSebaranHama;
}