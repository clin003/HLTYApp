import 'package:app/application.dart';
import 'package:app/models/taobao.tbk.dg.vegas.tlj.create.entity.dart';
import 'package:app/utils/log_util.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' show json;

import 'package:app/conf/app_config.dart';

import 'package:app/models/openapi_response.dart';

///taobao.tbk.dg.vegas.tlj.create( 淘宝客-推广者-淘礼金创建 )
///https://open.taobao.com/api.htm?docId=40173&docType=2
///创建淘礼金
class TbkDgVegasTljCreateRequest {
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl/sdk/taobao/TbkDgVegasTljCreate/V2';
  static final String botToken = Application.sp.getString('hlty_token') ?? '';
//http://127.0.0.1:8080/sdk/taobao/TbkDgVegasTljCreate/V2?item_id=608947589856
  static Future<TbkDgVegasTljCreateResponse> fetch({
    String adzone_id = '',
    String item_id,
    String total_num = '1',
    String name = '淘礼金来了',
    String per_face = '1',
    String send_start_time = '',
    String send_end_time = '',
    String use_end_time = '',
    String use_end_time_mode = '',
    String use_start_time = '',
    String appkey = '',
    String appsecret = '',
  }) async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/sdk/taobao/TbkDgVegasTljCreate/V2';
    }
    Map<String, dynamic> params = {
      "adzone_id": adzone_id,
      "item_id": item_id,
      "total_num": total_num,
      "name": name,
      "per_face": per_face,
      "send_start_time": send_start_time,
      "send_end_time": send_end_time,
      "use_end_time": use_end_time,
      "use_end_time_mode": use_end_time_mode,
      "use_start_time": use_start_time,
      "appkey": appkey,
      "appsecret": appsecret,
      "botoken": botToken,
      "retJson": true,
    };
    try {
      Response response = await Dio().post(_apiURL, queryParameters: params);
      if (response.statusCode == 200) {
        String _data = OpenAPIResponseModel.fromJson(response.data).data;
        LogUtil.v('TbkDgVegasTljCreateRequest>>_data:$_data');
        return TbkDgVegasTljCreateResponse.fromJson(json.decode(_data));
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class TbkDgVegasTljCreateRequestEx {
  static final String baseUrl = AppConfig().appAPIbaseUrl;
  static final String apiURL = '$baseUrl/sdk/taobao/TbkDgVegasTljCreate/V2';
  static final String botToken = Application.sp.getString('hlty_token') ?? '';
//  static final  _appkey =
//  Application.sp.getString('sdk_taobao_appkey') ?? '';
//  static final  _appsecret =
//  Application.sp.getString('sdk_taobao_appsecret') ?? '';
//  static final  _adzoneId =
//  Application.sp.getString('sdk_taobao_adzoneId') ?? '';

  static Future<OpenAPIResponseModel> fetch({
    String adzone_id = '',
    String item_id,
    String total_num = '1',
    String name = '淘礼金来了',
    String per_face = '1',
    String send_start_time = '',
    String send_end_time = '',
    String use_end_time = '',
    String use_end_time_mode = '',
    String use_start_time = '',
    String appkey = '',
    String appsecret = '',
  }) async {
     String  _appkey =
        Application.sp.getString('sdk_taobao_appkey') ?? '';
     String  _appsecret =
        Application.sp.getString('sdk_taobao_appsecret') ?? '';
     String  _adzoneId =
        Application.sp.getString('sdk_taobao_adzoneId') ?? '';

    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.sp.getString('url') ?? '';
    if (_appAPIbaseUrl != null && _appAPIbaseUrl!="") {
      _apiURL = '$_appAPIbaseUrl/sdk/taobao/TbkDgVegasTljCreate/V2';
    }
    LogUtil.v('TbkDgVegasTljCreateRequestEx>>_apiURL:$_apiURL');
    Map<String, dynamic> params = {
      "adzone_id": _adzoneId,
      "item_id": item_id,
      "total_num": total_num,
      "name": name,
      "per_face": per_face,
      "send_start_time": send_start_time,
      "send_end_time": send_end_time,
      "use_end_time": use_end_time,
      "use_end_time_mode": use_end_time_mode,
      "use_start_time": use_start_time,
      "appkey": _appkey,
      "appsecret": _appsecret,
      "botoken": botToken,
      "retJson": false,
    };
    LogUtil.v('TbkDgVegasTljCreateRequestEx>>params:$params');
    try {
      Response response = await Dio().post(_apiURL, queryParameters: params);
      if (response.statusCode == 200) {
        //        String _data = OpenAPIResponseModel.fromJson(response.data).data;
        LogUtil.v('TbkDgVegasTljCreateRequestEx>>_data:${response.data}');
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
