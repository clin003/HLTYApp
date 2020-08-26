import 'package:app/models/goods.dart';
import 'package:app/models/webviewDataModel.dart';
import 'package:app/pages/material/filter_list_9kuai9_page.dart';
import 'package:app/pages/material/material_list_bendishenghuo_page.dart';
import 'package:app/pages/material/material_list_daequan_page.dart';
import 'package:app/pages/material/material_list_haoquanzhibo_page.dart';
import 'package:app/pages/material/material_list_manjianzhe_page.dart';
import 'package:app/pages/material/material_list_muying_page.dart';
import 'package:app/pages/material/material_list_pinpaiquan_page.dart';
import 'package:app/pages/material/material_list_shishirexiao_page.dart';
import 'package:app/pages/material/material_page.dart';
import 'package:app/pages/register_page.dart';
import 'package:app/pages/tools/openapi/openapi_setting_page.dart';
import 'package:app/pages/tools/taolijin/taolijin_create_page.dart';
import 'package:app/pages/websocket/websocket_page.dart';
import 'package:app/pages/webview/webview_page.dart';
import 'package:app/utils/log_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:app/pages/home/index_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/look_img_page.dart';

import 'package:app/pages/search/search_data_page.dart';
import 'package:app/pages/splash_page.dart';
import 'package:app/utils/fluro_convert_utils.dart';
import 'package:app/pages/goods/goods_details_page.dart';

// splash 页面
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SplashPage();
});

// 登录页
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return LoginPage();
});

// 跳转到注册页
var registerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return RegisterPage();
});

// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return IndexPage(); //HomePage();
});


var realtimemessageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return WebsocketPage(); //HomePage();
    });
///本地生活
var bendishenghuoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialListBendishenghuoPage(); //HomePage();
    });

///好券直播
var haoquanzhiboHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialListHaoquanzhiboPage(); //HomePage();
    });

///品牌券
var pinpaiquanHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialListPinpaiquanPage(); //HomePage();
    });

///实时销量榜单
var shishirexiaoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialListShishirexiaoPage(); //HomePage();
    });

///满减折扣
var manjianzheHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialListManjianzhePage(); //HomePage();
    });

///天天特卖
var tiantiantemaiHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialIDPage(
        id: '31362',
        title: '天天特卖',
        totalResults: 200,
      ); //HomePage();
    });

///母婴专题
var muyingHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialListMuyingPage(); //HomePage();
    });
///大额神券
var daequanHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MaterialListDaequanPage(); //HomePage();
    });
///9.9包邮
var jiukuaijiuHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MateriaFilterList9kuai9Page(); //HomePage();
    });

//// 跳转到商品列表页（未完成）
//var goodsListHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//  String data = params['data'].first;
//  return Text(
//      GoodsItem.fromJson(FluroConvertUtils.string2map(data)).goodsTitle);
//});

/// 跳转到商品详情页
var goodsDetailsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String data = params['data'].first;
  GoodsItem _goodsItem = GoodsItem.fromJson(FluroConvertUtils.string2map(data));
  return GoodsDetails(_goodsItem.goodsId, goodsItem: _goodsItem);
});

///跳转到webView页面
var webViewHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String data = params['data'].first;
  WebviewDataModel _webviewData =
      WebviewDataModel.fromJson(FluroConvertUtils.string2map(data));
  return WebViewPage(
    title: _webviewData.title,
    url: _webviewData.url,
  );
});

var webViewExHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String url = FluroConvertUtils.fluroCnParamsDecode(params['url'].first);
  String title = FluroConvertUtils.fluroCnParamsDecode(params['title'].first);
  LogUtil.v('webViewExHandler:(url)$url,(title)$title');
  return WebViewPage(
    title: '$title',
    url: '$url',
  );
});

///跳转到淘礼金生成工具页面
var toolsTaolijinCreateHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String id = FluroConvertUtils.fluroCnParamsDecode(params['id'].first);
  String title = FluroConvertUtils.fluroCnParamsDecode(params['title'].first);
  String quanEndPrice =
      FluroConvertUtils.fluroCnParamsDecode(params['quanEndPrice'].first);
  String tbkCommission =
      FluroConvertUtils.fluroCnParamsDecode(params['tbkCommission'].first);
  String quanId = FluroConvertUtils.fluroCnParamsDecode(params['quanId'].first);
  LogUtil.v(
      'toolsTaolijinCreateHandler:(id)$id,(title)$title,(quanEndPrice)$quanEndPrice,(tbkCommission)$tbkCommission,(quanId)$quanId');
  return ToolsTaolijinCreatePage(
      id: id,
      title: title,
      quanEndPrice: quanEndPrice,
      tbkCommission: tbkCommission,
      quanId: quanId);
});

///跳转到openAPISetting配置页面
var openAPISettingHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return OpenAPISettingPage();
});
// // 跳转到每日推荐歌曲
// var topListHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//       return TopListPage();
//     });

// // 跳转到播放歌曲
// var playSongsHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//       return PlaySongsPage();
//     });

// // 跳转到评论
// var commentHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//       String data = params['data'].first;
//       return CommentPage(CommentHead.fromJson(FluroConvertUtils.string2map(data)));
//     });

// 跳转到搜索页面
var searchHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String data = '';
  if (params['data'] != null) {
    data = params['data'].first;
    Map _dataMap = FluroConvertUtils.string2map(data);
    data = _dataMap['data'];
  }
  LogUtil.v(
      'searchHandler:$data，'); //FluroConvertUtils：${FluroConvertUtils.string2map(data)}

  return SearchDataPage(
    text: data,
  );
});

///跳转到Material物料id页面
var materialHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String id = FluroConvertUtils.fluroCnParamsDecode(params['id'].first);
  String title = FluroConvertUtils.fluroCnParamsDecode(params['title'].first);
  int totalResults = int.parse(params['totalResults'].first);
  LogUtil.v('materialHandler:(id)$id,(title)$title');
  return MaterialIDPage(
    id: id,
    title: title,
    totalResults: totalResults,
  );
});

// 跳转到查看图片页面
var lookImgHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  List<String> imgs =
      FluroConvertUtils.fluroCnParamsDecode(params['imgs'].first).split(',');
  String index = params['index'].first;
  print(imgs);
  print(index);
  return LookImgPage(imgs, int.parse(index));
});
