part of 'hama_bloc.dart';

@freezed
class HamaEvent with _$HamaEvent {
  const factory HamaEvent.started() = _Started;
  const factory HamaEvent.getAllHama() = _GetAllHama;
}