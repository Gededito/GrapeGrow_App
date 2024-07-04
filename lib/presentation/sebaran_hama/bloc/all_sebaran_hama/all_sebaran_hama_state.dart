part of 'all_sebaran_hama_bloc.dart';

@freezed
class AllSebaranHamaState with _$AllSebaranHamaState {
  const factory AllSebaranHamaState.initial() = _Initial;
  const factory AllSebaranHamaState.loading() = _Loading;
  const factory AllSebaranHamaState.error(String message) = _Error;
  const factory AllSebaranHamaState.success(ListSebaranHamaResponse data) = _Succes;
}
