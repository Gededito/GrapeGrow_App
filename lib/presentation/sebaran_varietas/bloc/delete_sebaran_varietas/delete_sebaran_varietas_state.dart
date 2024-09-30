part of 'delete_sebaran_varietas_bloc.dart';

@freezed
class DeleteSebaranVarietasState with _$DeleteSebaranVarietasState {
  const factory DeleteSebaranVarietasState.initial() = _Initial;
  const factory DeleteSebaranVarietasState.loading() = _Loading;
  const factory DeleteSebaranVarietasState.error(String message) = _Error;
  const factory DeleteSebaranVarietasState.success(String message) = _Success;
}
