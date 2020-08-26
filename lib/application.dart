import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart' hide Router;
import 'package:get_it/get_it.dart';
import 'package:app/route/navigate_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application{
  static fluro.Router router;
  static GlobalKey<NavigatorState> key = GlobalKey();
  static SharedPreferences sp;
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;
  static double bottomBarHeight;
  static GetIt getIt = GetIt.instance;

  static initSp() async{
    sp = await SharedPreferences.getInstance();
  }

  static setupLocator(){
    getIt.registerSingleton(NavigateService());
  }

  static String getAppOpenAPIbaseUrl(){
    return Application.sp.getString('url')??'';
  }

}