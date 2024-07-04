import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  // Save Auth Token
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', authResponseModel.toJson());
  }

  // Remove Token Auth
  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  // Get Token or User
  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');

    return AuthResponseModel.fromJson(authData!);
  }
}