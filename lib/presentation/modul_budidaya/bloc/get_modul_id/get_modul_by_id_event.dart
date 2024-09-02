part of 'get_modul_by_id_bloc.dart';

@freezed
class GetModulByIdEvent with _$GetModulByIdEvent {
  const factory GetModulByIdEvent.started() = _Started;
  const factory GetModulByIdEvent.getModulById(int id) = _GetModulById;
}