import 'package:dio/dio.dart';
import 'dart:async';

import 'package:app/models/goods.dart';
import 'package:app/conf/app_config.dart';

/// openAPI 商品信息筛选
class FilterGoodsAPI {
  static final String baseUrl = AppConfig().openAPIbaseUrl;
  static final String apiURL = '$baseUrl/DataApi/GetGoodsFilter';

  static Future<List<GoodsItem>> fetch({int rate, int ratemax,int sales,int price,int pricemax, int pageSize}) async {
    Map<String, dynamic> params = {
      "rate": rate,
      "ratemax": ratemax,
      "sales": sales,
      "price": price,
      "pricemax": pricemax,
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
