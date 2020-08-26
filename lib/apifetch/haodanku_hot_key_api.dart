import 'dart:convert';

import 'package:app/models/haodanku_hot_key.dart';
import 'package:app/utils/log_util.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import 'package:app/conf/app_config.dart';

///方法：get
///热搜关键词记录API
///返回数据类型：json格式数据
///请求链接：http://v2.api.haodanku.com/hot_key
///请求示例：http://v2.api.haodanku.com/hot_key/apikey/你的apikey
class HaodankuHotKeyAPI {
  static final String baseUrl = AppConfig().haoDanKubaseUrl;
  static final String apikey = AppConfig().haoDanKuAppkey;
  static final String apiURL = '$baseUrl/hot_key/apikey/$apikey';

  static Future<List<String>> fetch() async {
    String _apiURL='$apiURL';
    List<String> hotKeyList=[];
    try {
      Response response = await Dio().get(_apiURL);
      if (response.statusCode == 200) {
//        LogUtil.e("HaodankuHotKeyAPI:fetch>>${response.data}");
        dynamic _data=response.data.toString();
        _data= _data.trim();
        HaodankuHotKeyRoot  entry= HaodankuHotKeyRoot.fromJson(json.decode(_data));
        if (entry!=null && entry.code>0 && entry.data.isNotEmpty){
          for( HaodankuHotKeyData data in entry.data){
            if (data.keyword!=null && data.keyword!=""){
              hotKeyList.add(data.keyword);
            }
          }
          return hotKeyList;

        }
        return hotKeyList;
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      LogUtil.e(e);
      return null;
    }
  }
}
