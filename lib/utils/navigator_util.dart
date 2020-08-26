import 'package:app/models/goods.dart';
import 'package:app/models/webviewDataModel.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:app/pages/look_img_page.dart';
import 'package:app/route/routes.dart';
import 'package:app/route/transparent_route.dart';
import 'fluro_convert_utils.dart';

import '../application.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  static _navigateToEx(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 30),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.fadeIn);
  }
  static goTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 30),
        RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.fadeIn);
  }

  /// 登录页
  static void goLoginPage(BuildContext context) {
//    _navigateTo(context, Routes.login, clearStack: true);
    _navigateToEx(context, Routes.login, clearStack: true);
  }

  /// 注册页
  static void goRegisterPage(BuildContext context) {
    _navigateTo(context, Routes.register, clearStack: true);
//    _navigateToEx(context, Routes.register, clearStack: true);
  }

  /// 首页
  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.home, clearStack: true);
//    _navigateToEx(context, Routes.home, clearStack: true);
  }

  /// 实时线报websocket页面    NavigatorUtil.goRealTimeMessagePage(context);
  static void goRealTimeMessagePage(BuildContext context) {
    _navigateToEx(context, Routes.realtimemessage, clearStack: false);
  }

  /// 本地生活页面
  static void goBendishenghuoPage(BuildContext context) {
    _navigateToEx(context, Routes.bendishenghuo, clearStack: false);
  }
  /// 好券直播页面
  static void goHaoquanzhiboPage(BuildContext context) {
    _navigateToEx(context, Routes.haoquanzhibo, clearStack: false);
  }
  /// 品牌券页面
  static void goPinpaiquanPage(BuildContext context) {
    _navigateToEx(context, Routes.pinpaiquan, clearStack: false);
  }
  /// 实时热销页面
  static void goShishirexiaoPage(BuildContext context) {
    _navigateToEx(context, Routes.shishirexiao, clearStack: false);
  }
  /// 满减折页面
  static void goManjianzhePage(BuildContext context) {
    _navigateToEx(context, Routes.manjianzhe, clearStack: false);
  }
  /// 天天特卖页面
  static void goTiantiantemaiPage(BuildContext context) {
    _navigateToEx(context, Routes.tiantiantemai, clearStack: false);
  }
  /// 9.9包邮页面
  static void goJiukuaijiuPage(BuildContext context) {
    _navigateToEx(context, Routes.jiukuaijiu, clearStack: false);
  }

//  /// 歌单详情
//  static void goPlayListPage(BuildContext context, {@required GoodsItem data}) {
//    _navigateTo(context,
//        "${Routes.goodsList}?data=${FluroConvertUtils.object2string(data)}");
//  }

  ///商品详情页
  static void goodsDetails(BuildContext context, {@required GoodsItem data}) {
    _navigateToEx(context,
        "${Routes.goodsDetails}?data=${FluroConvertUtils.object2string(data)}");
  }

  ///webView单页
  static void webView(BuildContext context, {@required WebviewDataModel data}) {
    _navigateToEx(context,
        "${Routes.webView}?data=${FluroConvertUtils.object2string(data)}");
  }

  ///webView单页Ex
  static void webViewEx(BuildContext context,
      {@required String url = 'https://www.lyhuilin.com', String title = ''}) {
    _navigateToEx(context,
        "${Routes.webViewEx}?url=${FluroConvertUtils.fluroCnParamsEncode(url)}&title=${FluroConvertUtils.fluroCnParamsEncode(title)}");
  }

  ///淘礼金生成单页
  static void goToolsTaolijinCreatePage(BuildContext context,
      {String id = '',
      String title = '',
      String quanEndPrice = '0.0',
      String tbkCommission = '0.0',
      String quanId = ''}) {
    _navigateToEx(context,
        "${Routes.toolsTaolijinCreate}?id=${FluroConvertUtils.fluroCnParamsEncode(id)}&title=${FluroConvertUtils.fluroCnParamsEncode(title)}&quanEndPrice=${FluroConvertUtils.fluroCnParamsEncode(quanEndPrice)}&tbkCommission=${FluroConvertUtils.fluroCnParamsEncode(tbkCommission)}&quanId=${FluroConvertUtils.fluroCnParamsEncode(quanId)}");
  }

  ///openAPI配置单页
  static void goOpenAPISettingPage(BuildContext context) {
    _navigateToEx(context, Routes.openAPISetting);
  }


  /// 搜索页面
  static void goSearchPage(BuildContext context, {String data}) {
    var _mapData = {"data": data};
    _navigateToEx(context,
        '${Routes.search}?data=${FluroConvertUtils.object2string(_mapData)}');
  }
  ///Material物料页面
  static void goMaterialPage(BuildContext context, {String id,String title,int totalResults}) {
//    var _mapData = {"data": data};
    _navigateToEx(context,
        '${Routes.material}?id=${FluroConvertUtils.fluroCnParamsEncode(id)}&title=${FluroConvertUtils.fluroCnParamsEncode(title)}&totalResults=$totalResults');
  }

  /// 查看图片页面
  static void goLookImgPage(
      BuildContext context, List<String> imgs, int index) {
//    Application.router.navigateTo(context, '${Routes.lookImg}?imgs=${FluroConvertUtils.object2string(imgs.join(','))}&index=$index', transitionBuilder: (){});
//    _navigateTo(context, '${Routes.lookImg}?imgs=${FluroConvertUtils.object2string(imgs.join(','))}&index=$index');
//    _navigateTo(context, '${Routes.lookImg}');
    Navigator.push(
      context,
      TransparentRoute(
        builder: (_) => LookImgPage(imgs, index),
      ),
    );
  }
}
