import 'package:dio/dio.dart';
import 'package:app/models/app_version_info_model.dart';

import 'dart:async';
import 'package:app/conf/app_config.dart';

class AppVersionJsonDio {
  //http://static.lyhuilin.com/app/com.lyhuilin.app/version.json
  static final String baseUrl = AppConfig().jsonAPIbaseUrl;
//  static final String baseUrl = AppConfig().staticAPIbaseUrl;
  static Future<AppVersionInfo> fetch() async {
    try {
      Response response = await Dio().get('$baseUrl/static/app/com.lyhuilin.app/version.json');
//      Response response = await Dio().get('$baseUrl/app/com.lyhuilin.app/version.json');
      if (response.statusCode == 200) {
        return AppVersionInfo.fromJson(response.data);
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
