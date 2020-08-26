import 'package:app/application.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' show json;

import 'package:app/conf/app_config.dart';
import 'package:app/models/tbk_dg_material_optional_entity.dart';
import 'package:app/models/openapi_response.dart';

/// taobao.tbk.sc.material.optional( 淘宝客-服务商-物料搜索 )
/// https://open.taobao.com/api.htm?docId=35263&docType=2&scopeId=13991
/// 通用物料搜索API（社交）
class TbkDgMaterialOptionalAPI {
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl/sdk/taobao/TbkMaterialOptional';

  static Future<TbkDgMaterialOptionalModelRoot> fetch({String query}) async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/sdk/taobao/TbkMaterialOptional';
    }
    Map<String, dynamic> params = {
      "q": query,
//      "page_no": pageNum,
//      "page_size": pageSize,
//      "device_value": "",
//      "device_encrypt": "",
//      "device_type": "",
//      "item_id": "",
//      "favorites_id": "",
      "retJson": true,
    };
    try {
      Response response = await Dio().get(_apiURL, queryParameters: params);
      if (response.statusCode == 200) {
        String _data = OpenAPIResponseModel.fromJson(response.data).data;

        return TbkDgMaterialOptionalModelRoot.fromJson(json.decode(_data));
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
