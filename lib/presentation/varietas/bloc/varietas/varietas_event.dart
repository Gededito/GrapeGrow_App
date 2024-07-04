part of 'varietas_bloc.dart';

@freezed
class VarietasEvent with _$VarietasEvent {
  const factory VarietasEvent.started() = _Started;
  const factory VarietasEvent.getAllVarietas() = _GetAllVarietas;
}