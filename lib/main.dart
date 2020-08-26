//import 'dart:html';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart' hide Router;
import 'package:app/pages/splash_page.dart';
import 'package:app/provider/user_model.dart';

import 'package:app/route/navigate_service.dart';
import 'package:app/route/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app/generated/l10n.dart';

import 'application.dart';
import 'utils/log_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
//    debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugRepaintRainbowEnabled = true;

//  创建路由对象
  final fluro.Router router = fluro.Router();
//  配置路由集Routes的路由对象
  Routes.configureRoutes(router);
//  指定Appliation的路由对象
  Application.router = router;
  Application.setupLocator();
  LogUtil.init(isDebug: !kReleaseMode, tag: '白菜林调试日志');

  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserModel>(
        create: (_) => UserModel(),
      ),
    ],
    child: MyApp(),
  ));
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
//  FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: '慧林淘友',
      navigatorKey: Application.getIt<NavigateService>().key,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        splashColor: Colors.transparent,
        tooltipTheme: TooltipThemeData(verticalOffset: -100000),
      ),
      darkTheme: ThemeData.dark(),
      home: SplashPage(),
//      生成路由的回调函数，当导航到目标路由时，会使用回调函数来生成界面
      onGenerateRoute: Application.router.generator,
    );
  }
}
