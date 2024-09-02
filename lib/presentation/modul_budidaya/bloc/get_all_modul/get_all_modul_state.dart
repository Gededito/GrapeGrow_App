part of 'get_all_modul_bloc.dart';

@freezed
class GetAllModulState with _$GetAllModulState {
  const factory GetAllModulState.initial() = _Initial;
  const factory GetAllModulState.loading() = _Loading;
  const factory GetAllModulState.error(String message) = _Error;
  const factory GetAllModulState.success(GetAllModulResponse data) = _Success;
}
