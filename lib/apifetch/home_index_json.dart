import 'package:dio/dio.dart';
import 'package:app/models/index_home.dart';

import 'dart:async';
import 'package:app/conf/app_config.dart';

class HomeIndexJsonDio {
  static final String baseUrl = AppConfig().jsonAPIbaseUrl;
  static Future<APPIndexRoot> fetch() async {
    try {
      Response response = await Dio().get('$baseUrl/static/app/index.json');
      if (response.statusCode == 200) {
        return APPIndexRoot.fromJson(response.data);
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
