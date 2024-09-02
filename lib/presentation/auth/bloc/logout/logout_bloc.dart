import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/auth_remote_datasource.dart';

part 'logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const _Initial()) {
    on<LogoutEvent>((event, emit) async {
      
      emit(const _Loading());

      try {
        final response = await AuthRemoteDatasource().logout();

        response.fold(
          (l) => emit(_Error(l)),
          (r) => emit(const _Success())
        );
      } catch (e) {
        emit(_Error(e.toString()));
      }

    });
  }
}
