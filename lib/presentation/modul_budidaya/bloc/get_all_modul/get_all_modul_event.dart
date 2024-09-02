part of 'get_all_modul_bloc.dart';

@freezed
class GetAllModulEvent with _$GetAllModulEvent {
  const factory GetAllModulEvent.started() = _Started;
  const factory  GetAllModulEvent.getAllModul() = _GetAllModul;
}