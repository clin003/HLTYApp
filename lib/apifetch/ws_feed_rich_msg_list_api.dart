import 'package:app/application.dart';
import 'package:app/models/feed_rich_msg_model.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:app/conf/app_config.dart';

/// 获取Ws服务器缓存的最近N条消息
class WsFeedRichMsgListAPI {
  static final String baseUrl = AppConfig().wsAPIbaseUrl;
  static final String apiURL = '$baseUrl/ws/feedMsgList';

  static Future<List<FeedRichMsgModel>> fetch() async {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/ws/feedMsgList';
    }

    try {
      Response response = await Dio().get(_apiURL);
      if (response.statusCode == 200) {
        return FeedRichMsgListResponseModel.fromJson(response.data).data;
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
