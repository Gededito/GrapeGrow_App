part of 'delete_sebaran_varietas_bloc.dart';

@freezed
class DeleteSebaranVarietasEvent with _$DeleteSebaranVarietasEvent {
  const factory DeleteSebaranVarietasEvent.started() = _Started;
  const factory DeleteSebaranVarietasEvent.deleteSebaranVarietas(int id) = _DeleteSebaranVarietas;
}