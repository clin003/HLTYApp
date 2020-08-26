import 'package:dio/dio.dart';
import 'dart:async';

import 'package:app/models/goods.dart';
import 'package:app/conf/app_config.dart';

/// openAPI 商品信息流
class FeedGoodsAPI {
  static final String baseUrl = AppConfig().openAPIbaseUrl;
  static final String apiURL = '$baseUrl/DataApi/GetGoodsFeed';

  static Future<List<GoodsItem>> fetch({int maxId, int minId, int pageSize}) async {
    Map<String, dynamic> params = {
      "maxid": maxId,
      "minid": minId,
      "num": pageSize,
      "retJson": false,
    };
    try {
      Response response = await Dio().get(apiURL, queryParameters: params);
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
