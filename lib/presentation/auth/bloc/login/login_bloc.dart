import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/auth_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/request/login_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      
      emit(const _Loading());

      final response = await AuthRemoteDatasource().login(event.data);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
