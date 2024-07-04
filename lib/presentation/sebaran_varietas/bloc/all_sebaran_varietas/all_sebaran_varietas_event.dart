part of 'all_sebaran_varietas_bloc.dart';

@freezed
class AllSebaranVarietasEvent with _$AllSebaranVarietasEvent {
  const factory AllSebaranVarietasEvent.started() = _Started;
  const factory AllSebaranVarietasEvent.getAllSebaran() = _GetAllSebaranVarietas;
}