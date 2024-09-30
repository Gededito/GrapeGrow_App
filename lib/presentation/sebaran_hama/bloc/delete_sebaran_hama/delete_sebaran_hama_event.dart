part of 'delete_sebaran_hama_bloc.dart';

@freezed
class DeleteSebaranHamaEvent with _$DeleteSebaranHamaEvent {
  const factory DeleteSebaranHamaEvent.started() = _Started;
  const factory DeleteSebaranHamaEvent.deleteSebaranHama(int id) = _DeleteSebaranHama;
}