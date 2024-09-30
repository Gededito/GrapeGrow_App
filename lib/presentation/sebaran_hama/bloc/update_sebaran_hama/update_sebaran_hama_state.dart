part of 'update_sebaran_hama_bloc.dart';

@freezed
class UpdateSebaranHamaState with _$UpdateSebaranHamaState {
  const factory UpdateSebaranHamaState.initial() = _Initial;
  const factory UpdateSebaranHamaState.loading() = _Loading;
  const factory UpdateSebaranHamaState.success(AddSebaranHamaResponse updateSebaranHama) = _Success;
  const factory UpdateSebaranHamaState.error(String message) = _Error;
}
