import 'package:app/application.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' show json;

import 'package:app/conf/app_config.dart';
import 'package:app/models/tbk_dg_material_optional_entity.dart';
import 'package:app/models/openapi_response.dart';

/// taobao.tbk.privilege.get( 淘宝客-服务商-单品券高效转链 )
/// https://open.taobao.com/api.htm?docId=28625&docType=2&scopeId=12403
class TbkPrivilegeGetRequestlAPI {
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl/sdk/taobao/TbkPrivilegeGet';
  static final String botToken = Application.sp.getString('hlty_token') ?? '';

  static Future<OpenAPIResponseModel> fetch(
      {String quanid = '', String item_id, String relation_id = ''}) async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/sdk/taobao/TbkPrivilegeGet';
    }
    Map<String, dynamic> params = {
      "quanid": quanid,
      "item_id": item_id,
      "relation_id": relation_id,
      "botoken": botToken,
      "retJson": false,
    };
    try {
      Response response = await Dio().post(_apiURL, queryParameters: params);
      if (response.statusCode == 200) {
//        String _data = OpenAPIResponseModel.fromJson(response.data).data;
//
//        return OpenAPIResponseModel.fromJson(json.decode(_data));
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
