import 'package:app/application.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import 'package:app/models/goods.dart';
import 'package:app/conf/app_config.dart';

/// taobao.tbk.dg.optimus.material( 淘宝客-推广者-物料精选 )
/// https://open.taobao.com/api.htm?docId=33947&docType=2&scopeId=16518
/// 通用物料推荐，传入官方公布的物料id，可获取指定物料
class MaterialGoodsAPI {
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl/sdk/taobao/TbkDgOptimusMaterial';

  static Future<List<GoodsItem>> fetch(String id,
      {int pageNum = 0, int pageSize = 10, String itemId}) async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/sdk/taobao/TbkDgOptimusMaterial';
    }
    Map<String, dynamic> params = {
      "material_id": id,
      "page_no": pageNum,
      "page_size": pageSize,
      "device_value": "",
      "device_encrypt": "",
      "device_type": "",
      "item_id": itemId,
      "favorites_id": "",
      "retJson": false,
    };
    try {
      Response response = await Dio().get(_apiURL, queryParameters: params);
      if (response.statusCode == 200) {
        return GoodsList.fromJson(response.data).data;
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
