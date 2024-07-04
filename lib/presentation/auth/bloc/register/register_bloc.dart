import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapegrow_apps/data/datasources/auth_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/request/register_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {

      emit(const _Loading());

      final response = await AuthRemoteDatasource().register(event.data);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
