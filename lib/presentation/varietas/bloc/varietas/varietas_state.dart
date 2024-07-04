part of 'varietas_bloc.dart';

@freezed
class VarietasState with _$VarietasState {
  const factory VarietasState.initial() = _Initial;
  const factory VarietasState.loading() = _Loading;
  const factory VarietasState.error(String message) = _Error;
  const factory VarietasState.success(VarietasResponseModel varietas) = _Success;
}
