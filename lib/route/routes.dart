import 'package:app/pages/home/index_page.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart' hide Router;
import 'package:app/route/route_handles.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String register = "/register";
  ///实时线报websocket页面
  static String realtimemessage = "/realtimemessage";

  ///本地生活
  static String bendishenghuo = "/bendishenghuo";

  ///好券直播
  static String haoquanzhibo = "/haoquanzhibo";

  ///品牌券
  static String pinpaiquan = "/pinpaiquan";

  ///实时销量
  static String shishirexiao = "/shishirexiao";

  ///满减折扣（折上折）
  static String manjianzhe = "/manjianzhe";

  ///折上折（满减折扣）
  static String zheshangzhe = "/zheshangzhe";

  ///天天特卖
  static String tiantiantemai = "/tiantiantemai";

  ///母婴
  static String muying = "/muying";

  ///大额券
  static String daequan = "/daequan";
  static String jiukuaijiu = "/jiukuaijiu";

  static String goodsList = "/goods_list";
  static String goodsDetails = "/goods_details";
  static String webView = '/webView';
  static String webViewEx = '/webViewEx';
  static String toolsTaolijinCreate = '/toolsTaolijinCreate';
  static String openAPISetting = "/openAPISetting";

  static String search = "/search";
  static String material = "/material";

  static String lookImg = "/look_img";

  static void configureRoutes(fluro.Router router) {
    router.notFoundHandler = new fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
//      return LoginPage();
      return IndexPage();
    });
    router.define(root, handler: splashHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(home, handler: homeHandler);
    router.define(realtimemessage, handler: realtimemessageHandler);


    router.define(bendishenghuo, handler: bendishenghuoHandler);
    router.define(haoquanzhibo, handler: haoquanzhiboHandler);
    router.define(pinpaiquan, handler: pinpaiquanHandler);
    router.define(shishirexiao, handler: shishirexiaoHandler);
    router.define(manjianzhe, handler: manjianzheHandler);
    router.define(zheshangzhe, handler: manjianzheHandler);
    router.define(tiantiantemai, handler: tiantiantemaiHandler);
    router.define(muying, handler: muyingHandler);
    router.define(daequan, handler: daequanHandler);
    router.define(jiukuaijiu, handler: jiukuaijiuHandler);

    // router.define(dailySongs, handler: dailySongsHandler);
//    router.define(goodsList, handler: goodsListHandler);
    router.define(goodsDetails, handler: goodsDetailsHandler);
    router.define(webView, handler: webViewHandler);
    router.define(webViewEx, handler: webViewExHandler);
    router.define(toolsTaolijinCreate, handler: toolsTaolijinCreateHandler);
    router.define(openAPISetting, handler: openAPISettingHandler);
    // router.define(playSongs, handler: playSongsHandler);
    // router.define(comment, handler: commentHandler);
    router.define(search, handler: searchHandler);
    router.define(material, handler: materialHandler);

    router.define(lookImg, handler: lookImgHandler);
  }
}
