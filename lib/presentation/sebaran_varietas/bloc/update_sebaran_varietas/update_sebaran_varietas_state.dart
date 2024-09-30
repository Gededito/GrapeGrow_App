part of 'update_sebaran_varietas_bloc.dart';

@freezed
class UpdateSebaranVarietasState with _$UpdateSebaranVarietasState {
  const factory UpdateSebaranVarietasState.initial() = _Initial;
  const factory UpdateSebaranVarietasState.loading() = _Loading;
  const factory UpdateSebaranVarietasState.error(String message) = _Error;
  const factory UpdateSebaranVarietasState.success(AddSebaranVarietasResponse updateSebaranVarietas) = _Success;
}
