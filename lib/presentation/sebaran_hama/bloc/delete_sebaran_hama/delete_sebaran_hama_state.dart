part of 'delete_sebaran_hama_bloc.dart';

@freezed
class DeleteSebaranHamaState with _$DeleteSebaranHamaState {
  const factory DeleteSebaranHamaState.initial() = _Initial;
  const factory DeleteSebaranHamaState.loading() = _Loading;
  const factory DeleteSebaranHamaState.success(String message) = _Success;
  const factory DeleteSebaranHamaState.error(String message) = _Error;
}
