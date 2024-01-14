import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vikncode_test/domain/model/login_request_model.dart';
import 'package:vikncode_test/domain/model/login_response_model.dart';

class LoginRepository {
  Dio dio = Dio();

  Future<LoginResponseModel> userLogin(LoginRequestModel userModel) async {
    try {
      Response response = await dio.post(
          'https://api.accounts.vikncodes.com/api/v1/users/login',
          data: userModel.toJson());
      log(response.toString(), name: 'login respose');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final result = response.data;
        final data = LoginResponseModel.fromJson(response.data);
        return data;
      } else {
        return LoginResponseModel(error: 'Login faild');
      }
    } catch (e) {
      log(e.toString(), name: 'login server error');
      return LoginResponseModel(error: 'Server error');
    }
  }
}
