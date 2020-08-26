
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize{
  static void init(BuildContext context){
//    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    ScreenUtil.init(context,width: 750.0, height: 1334.0, allowFontScaling: true);
  }
// ScreenUtil.init( width: 750, height: 1334);
  static double height(double value){
    return ScreenUtil().setHeight(value);
  }

  static double width(double value){
    return ScreenUtil().setWidth(value);
  }

  static double sp(double value){
    return ScreenUtil().setSp(value);
  }


}

