import 'package:app/application.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' show json;

import 'package:app/conf/app_config.dart';
import 'package:app/models/tbk_dg_material_optional_entity.dart';
import 'package:app/models/openapi_response.dart';

/// taobao.tbk.tpwd.create( 淘宝客-公用-淘口令生成 )
/// https://open.taobao.com/api.htm?docId=31127&docType=2
/// 提供淘客生成淘口令接口，淘客提交口令内容、logo、url等参数，生成淘口令关键key如：￥SADadW￥，后续进行文案包装组装用于传播
class TbkTpwdCreateRequestAPI {
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl/sdk/taobao/TbkTpwdCreate';
  static final String botToken = Application.sp.getString('hlty_token') ?? '';

  static Future<OpenAPIResponseModel> fetch(String url,
      {String text = '', String logo = ''}) async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/sdk/taobao/TbkTpwdCreate';
    }
    Map<String, dynamic> params = {
      "url": url,
      "text": text,
      "logo": logo,
      "botoken": botToken,
      "retJson": false,
    };
    try {
      Response response = await Dio().post(_apiURL, queryParameters: params);
      if (response.statusCode == 200) {
        return OpenAPIResponseModel.fromJson(response.data);
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
