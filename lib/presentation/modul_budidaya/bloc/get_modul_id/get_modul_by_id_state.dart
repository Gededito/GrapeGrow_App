part of 'get_modul_by_id_bloc.dart';

@freezed
class GetModulByIdState with _$GetModulByIdState {
  const factory GetModulByIdState.initial() = _Initial;
  const factory GetModulByIdState.loading() = _Loading;
  const factory GetModulByIdState.error(String message) = _Error;
  const factory GetModulByIdState.success(GetModulByIdResponse getModulByIdResponse) = _Success;
}
