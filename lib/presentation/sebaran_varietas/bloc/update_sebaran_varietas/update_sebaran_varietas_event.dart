part of 'update_sebaran_varietas_bloc.dart';

@freezed
class UpdateSebaranVarietasEvent with _$UpdateSebaranVarietasEvent {
  const factory UpdateSebaranVarietasEvent.started() = _Started;
  const factory UpdateSebaranVarietasEvent.updateSebaran(
    UpdateSebaranVarietas data,
    int id,
  ) = _UpdateSebaranVarietas;
}