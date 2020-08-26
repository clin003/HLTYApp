import 'dart:convert';

import 'package:app/utils/log_util.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import 'package:app/models/haodanku_item_detail.dart';
import 'package:app/conf/app_config.dart';

///方法：get
///返回数据类型：json格式数据
///请求链接：http://v2.api.haodanku.com/item_detail
///请求示例：http://v2.api.haodanku.com/item_detail/apikey/你的apikey/itemid/557787124271
class HaodankuItemDetailAPI {
  static final String baseUrl = AppConfig().haoDanKubaseUrl;
  static final String apikey = AppConfig().haoDanKuAppkey;
  static final String apiURL = '$baseUrl/item_detail/apikey/$apikey/itemid';

  static Future<HaodankuItemDetailRoot> fetch(String id
     ) async {
    String _apiURL='$apiURL/$id';
    try {
      Response response = await Dio().get(_apiURL);
      if (response.statusCode == 200) {
//        LogUtil.e("HaodankuItemDetailAPI:${response.data}");
        dynamic _data=response.data.toString();
        _data= _data.trim();

        return HaodankuItemDetailRoot.fromJson(json.decode(_data));
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      LogUtil.e(e);
      return null;
    }
  }
}
