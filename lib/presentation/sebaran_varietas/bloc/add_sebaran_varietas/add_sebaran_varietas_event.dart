part of 'add_sebaran_varietas_bloc.dart';

@freezed
class AddSebaranVarietasEvent with _$AddSebaranVarietasEvent {
  const factory AddSebaranVarietasEvent.started() = _Started;
  const factory AddSebaranVarietasEvent.addSebaranVarietas(SebaranVarietasRequest data) = _AddSebaranVarietas;
}