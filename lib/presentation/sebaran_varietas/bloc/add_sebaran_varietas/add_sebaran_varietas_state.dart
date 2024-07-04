part of 'add_sebaran_varietas_bloc.dart';

@freezed
class AddSebaranVarietasState with _$AddSebaranVarietasState {
  const factory AddSebaranVarietasState.initial() = _Initial;
  const factory AddSebaranVarietasState.loading() = _Loading;
  const factory AddSebaranVarietasState.error(String message) = _Error;
  const factory AddSebaranVarietasState.success(AddSebaranVarietasResponse addSebaranVarietas) = _Success;
}
