//import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:app/models/tbk_activity.dart' as mBanner;

import 'package:app/models/goods.dart';
import 'package:app/models/user.dart';
import 'package:app/route/navigate_service.dart';
import 'package:app/route/routes.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/loading.dart';

import '../application.dart';
import '../conf/app_config.dart';
import 'custom_log_interceptor.dart';

class NetUtils {
  static Dio _dio;
  // https://eco.lyhuilin.com/
  // https://vip.lyhuilin.com/
  static final String baseUrl = AppConfig().openAPIbaseUrl;

  static void init() async {
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;
    // CookieJar cj = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: '$baseUrl', followRedirects: false))
      // ..interceptors.add(CookieManager(cj))
      ..interceptors
          .add(CustomLogInterceptor(responseBody: true, requestBody: true));
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static Future<Response> _post(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.post(url, queryParameters: params);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200), () {
      Application.getIt<NavigateService>().popAndPushNamed(Routes.login);
      Utils.showToast('登录失效，请重新登录');
    });
  }

  /// 登录
  static Future<User> login(
      BuildContext context, String phone, String password) async {
    var response = await _post(context, '/login', params: {
      'mobile': phone,
      'password': password,
      'action': "userlogin",
    });

    return User.fromJson(response.data);
  }

  /// 注册
  static Future<User> register(
      BuildContext context, String phone, String password, String email,
      {String name = "APP.No10000."}) async {
    var response = await _post(context, '/v1/user', params: {
      'mobile': phone,
      'password': password,
      'email': email,
      'name': name,
      'action': "adduserinfo",
    });

    return User.fromJson(response.data);
  }
}
