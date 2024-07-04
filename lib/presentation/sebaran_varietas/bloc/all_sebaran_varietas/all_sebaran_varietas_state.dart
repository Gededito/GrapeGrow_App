part of 'all_sebaran_varietas_bloc.dart';

@freezed
class AllSebaranVarietasState with _$AllSebaranVarietasState {
  const factory AllSebaranVarietasState.initial() = _Initial;
  const factory AllSebaranVarietasState.loading() = _Loading;
  const factory AllSebaranVarietasState.error(String message) = _Error;
  const factory AllSebaranVarietasState.success(ListSebaranVarietasResponse data) = _Succes;
}
