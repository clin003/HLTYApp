import 'package:app/application.dart';
import 'package:app/models/feed_rich_msg_model.dart';
import 'package:app/utils/log_util.dart';
import 'package:dio/dio.dart';

import 'dart:async';

///发送到慧广播
class HuiguangboMsgPushToWsDio {
//  static final String baseUrl = AppConfig().appAPIbaseUrl;
//  static final String apiURL = '$baseUrl/ws/push/';
  static final String _botToken = Application.sp.getString('hlty_token') ?? '';
  static Future<bool> fetch(FeedRichMsgModel huiguangboMsgModel) async {
    String _apiURL = ''; //apiURL
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null &&
        _appAPIbaseUrl != '' &&
        _botToken != null &&
        _botToken != '') {
      _apiURL = '$_appAPIbaseUrl/ws/push/$_botToken';
    } else {
      return false;
    }
    LogUtil.v('HuiguangboMsgPushToWsDio>>_apiURL:$_apiURL');
    LogUtil.v(
        'HuiguangboMsgPushToWsDio>>queryParameters:${huiguangboMsgModel.toJson()}');
    if (huiguangboMsgModel?.msgTime==null || huiguangboMsgModel.msgTime.isEmpty){
      var timeNow=  DateTime.now();
      var _msgTime= "${timeNow.year}-${timeNow.month}-${timeNow.day} ${timeNow.hour}:${(timeNow.minute < 10) ? '0${timeNow.minute}' : timeNow.minute}:${(timeNow.second < 10) ? '0${timeNow.second}' : timeNow.second}";
      huiguangboMsgModel.msgTime=_msgTime;
    }
    try {
      Response response = await Dio().post(
        _apiURL,
        data: huiguangboMsgModel.toJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        LogUtil.v('HuiguangboMsgPushToWsDio>>fetch:${response.data}');
        return true;
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
//      print(e);
      LogUtil.v('HuiguangboMsgPushToWsDio>>catch:$e');
      return null;
    }
  }
}

///发送到慧广播
class HuiguangboMsgPushToWsDioEx {
//  static final String baseUrl = AppConfig().appAPIbaseUrl;
//  static final String apiURL = '$baseUrl/ws/push/';
  static final String _botToken = Application.sp.getString('hlty_token') ?? '';
  static Future<bool> fetch(
      {String msgtype = 'rich',
      String msgID = '',
      String textContent = '',
      String imagePicURL = ''}) async {
    String _apiURL = ''; //apiURL
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null &&
        _appAPIbaseUrl != '' &&
        _botToken != null &&
        _botToken != '') {
      _apiURL = '$_appAPIbaseUrl/ws/push/$_botToken';
    } else {
      return false;
    }
    if (msgID.isEmpty) {
      msgID = DateTime.now().millisecondsSinceEpoch.toString();
      LogUtil.v('HuiguangboMsgPushToWsDioEx>(msgID)$msgID');
    }
    var timeNow=  DateTime.now();
    var _msgTime= "${timeNow.year}-${timeNow.month}-${timeNow.day} ${timeNow.hour}:${(timeNow.minute < 10) ? '0${timeNow.minute}' : timeNow.minute}:${(timeNow.second < 10) ? '0${timeNow.second}' : timeNow.second}";

    FeedRichMsgModel _huiguangboMsg = FeedRichMsgModel(
      msgtype: 'rich',
      msgID: '$msgID',
      msgTime: '$_msgTime',
      image: FeedRichMsgModelImage(picURL: '$imagePicURL', filePath: ''),
      text: FeedRichMsgModelText(
        content: '$textContent',
      ),
    );

    LogUtil.v('HuiguangboMsgPushToWsDioEx>>_apiURL:$_apiURL');
    LogUtil.v(
        'HuiguangboMsgPushToWsDioEx>>queryParameters:${_huiguangboMsg.toJson()}');
    try {
      Response response = await Dio().post(
        _apiURL,
        data: _huiguangboMsg.toJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        LogUtil.v('HuiguangboMsgPushToWsDioEx>>fetch:${response.data}');
        return true;
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
//      print(e);
      LogUtil.v('HuiguangboMsgPushToWsDioEx>>catch:$e');
      return false;
    }
  }
}
