import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late SharedPreferences sharedPreferences;
  Dio dio = Dio();

  SharedPref() {
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveAccessToken(String accessToken) async {
    await sharedPreferences.setString('token', accessToken);
  }

  Future<String?> getAccessToken() async {
    return sharedPreferences.getString('token');
  }


}
