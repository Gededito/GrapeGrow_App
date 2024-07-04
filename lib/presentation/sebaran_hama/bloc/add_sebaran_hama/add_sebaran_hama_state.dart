part of 'add_sebaran_hama_bloc.dart';

@freezed
class AddSebaranHamaState with _$AddSebaranHamaState {
  const factory AddSebaranHamaState.initial() = _Initial;
  const factory AddSebaranHamaState.loading() = _Loading;
  const factory AddSebaranHamaState.error(String message) = _Error;
  const factory AddSebaranHamaState.success(AddSebaranHamaResponse addSebaranHama) = _Success;
}
