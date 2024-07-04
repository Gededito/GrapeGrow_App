part of 'hama_bloc.dart';

@freezed
class HamaState with _$HamaState {
  const factory HamaState.initial() = _Initial;
  const factory HamaState.loading() = _Loading;
  const factory HamaState.error(String message) = _Error;
  const factory HamaState.success(HamaResponseModel hama) = _Success;
}
