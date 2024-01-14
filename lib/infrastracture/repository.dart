import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vikncode_test/domain/model/login_request_model.dart';
import 'package:vikncode_test/domain/model/login_response_model.dart';
import 'package:vikncode_test/domain/model/sales_list_request_model.dart';
import 'package:vikncode_test/domain/model/sales_list_response_model.dart';
import 'package:vikncode_test/domain/shared_pref.dart';

class Repository {
  Future<LoginResponseModel> userLogin(LoginRequestModel userModel) async {
    SharedPref sharedPref = SharedPref();
    Dio dio = Dio();

    try {
      Response response = await dio.post(
          'https://api.accounts.vikncodes.com/api/v1/users/login',
          data: userModel.toJson());
      log(response.toString(), name: 'login respose');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final result = response.data;
        final data = LoginResponseModel.fromJson(response.data);
        String accessToken = response.data['data']['access'];
        await sharedPref.saveAccessToken(accessToken);

        return data;
      } else {
        return LoginResponseModel(error: 'Login faild');
      }
    } catch (e) {
      log(e.toString(), name: 'login server error');
      return LoginResponseModel(error: 'Server error');
    }
  }

  Future<SalesListResponseModel?> salesList(
      SalesListRequestModel requestModel) async {
    try {
      SharedPref sharedPref = SharedPref();
      await sharedPref.initSharedPreferences();

      String? accessToken = await sharedPref.getAccessToken();

      // log(accessToken.toString(), name: 'dfdfdf');

      if (accessToken == null || accessToken.trim().isEmpty) {
        return null;
      }
      accessToken = accessToken.trim();

      Dio dio = Dio();
      Response response = await dio.post(
        'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/',
        data: requestModel.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      // log(response.toString(), name: 'sales list');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final report = SalesListResponseModel.fromJson(response.data);
        return report;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'sales list server error');
      return null;
    }
  }
}
