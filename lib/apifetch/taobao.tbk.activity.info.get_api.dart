import 'package:app/application.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' show json;

import 'package:app/conf/app_config.dart';
import 'package:app/models/tbk_dg_material_optional_entity.dart';
import 'package:app/models/openapi_response.dart';

/// taobao.tbk.activity.info.get( 淘宝客-推广者-官方活动信息获取 )
/// https://open.taobao.com/api.htm?docId=48340&docType=2
/// 支持通过推广位和活动物料id获取活动详情，包含url，微信推广二维码地址等
class TbkActivityInfoGetRequestAPI {
  static final String apiPath = '/sdk/taobao/TbkActivityInfoGet';
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl$apiPath';
  static final String botToken = Application.sp.getString('hlty_token') ?? '';

  static Future<OpenAPIResponseModel> fetch(String activityMaterialId,
      {String subPid = '', String relationId = '',}) async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl$apiPath';
    }
    Map<String, dynamic> params = {
      "activity_material_id": activityMaterialId,
      "sub_pid": subPid,
      "relation_id": relationId,
      "union_id":"HLTY_APP",
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
