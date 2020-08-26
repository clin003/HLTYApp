import 'package:app/application.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' show json;
import 'package:app/models/goods.dart';
//import 'package:app/models/goods.dart';
import 'package:app/conf/app_config.dart';
import 'package:app/models/tbk_dg_material_optional_entity.dart';
import 'package:app/models/openapi_response.dart';
import 'package:flutter/foundation.dart';

/// taobao.tbk.sc.material.optional( 淘宝客-服务商-物料搜索 )
/// https://open.taobao.com/api.htm?docId=35263&docType=2&scopeId=13991
/// 通用物料搜索API（社交）
class SearchGoodsAPI {
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl/sdk/taobao/TbkMaterialOptional';

  static Future<List<GoodsItem>> fetch(
      {String query,String materialId='17004',int pageNum=1,int pageSize=10}) async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application .getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/sdk/taobao/TbkMaterialOptional';
    }
    Map<String, dynamic> params = {
      "q": query,
      "material_id":materialId,
      "page_no": pageNum,
      "page_size": pageSize,
//      "device_value": "",
//      "device_encrypt": "",
//      "device_type": "",
      "start_price": "1",
      "start_dsr": "5000",
      "retJson": false,
    };
    try {
      Response response = await Dio().get(_apiURL, queryParameters: params);
      if (response.statusCode == 200) {
        return GoodsList.fromJson(response.data).data;
//        String _data = OpenAPIResponseModel.fromJson(response.data).data;
//        return TbkDgMaterialOptionalModelRoot.fromJson(json.decode(_data));
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
