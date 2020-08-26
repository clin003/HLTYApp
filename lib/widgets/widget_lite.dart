import 'package:app/application.dart';
import 'package:app/config/appcolors.dart';
import 'package:app/utils/app_size.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsuper/fsuper.dart';

SizedBox buildBiggestMargin() {
  return const SizedBox(
    height: 66,
  );
}

SizedBox buildBigMargin() {
  return const SizedBox(
    height: 36,
  );
}

SizedBox buildMiddleMargin() {
  return const SizedBox(
    height: 18,
  );
}

SizedBox buildSmallMargin() {
  return const SizedBox(
    height: 10,
  );
}

void searching(BuildContext context) {
  buildshowDialog(context, "Searching...");
}

void buildshowDialog(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  msg,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            backgroundColor: Colors.black45,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ));
}

void buildshowDialogImage(BuildContext context, String imgUrl,
    {VoidCallback onTap}) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            backgroundColor: Colors.white.withOpacity(0.0),
            content: GestureDetector(
              child: Image.network(
                imgUrl,
                width: Application.screenWidth,
                height: Application.screenWidth,
              ),
              onTap: onTap,
            ),
//        backgroundColor: Colors.black45,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ));
}

Padding buildDesc(String desc) {
  return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        desc,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ));
}

Container buildTitle(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.all(9),
    color: Color(0xffe0e0e0).withOpacity(0.38),
    child: Text(
      title,
      style: TextStyle(color: Colors.grey),
    ),
  );
}

Widget buildTitleFsuper(String title,{VoidCallback onClickMore}) {
  return FSuper(
    text: title,
    width: double.infinity,
//    padding: EdgeInsets.only(left: 10.0),
    margin: EdgeInsets.only(left:10.0,top:10.0,right:10.0,bottom:10.0),
//    strokeColor: Color(0xfffee0cd),
//    strokeWidth: 0.1,
    textAlignment: Alignment.centerLeft,
    textAlign: TextAlign.left,
    textSize: AppSize.sp(28.0),
    child1: FSuper(text: (onClickMore==null)?'':'更多>',textSize: AppSize.sp(25.0),textColor: Colors.grey,),
    child1Alignment: Alignment.centerRight,
    child1Margin: EdgeInsets.only(left:10.0,top:10.0,right:10.0,bottom:10.0),
    onChild1Click: onClickMore,
//    child2: FDottedLine(width: double.infinity,color: Colors.grey,),
//    child2Alignment: Alignment.bottomCenter,
//    child2Margin: EdgeInsets.only(left: 10.0,top: 20.0,right: 10.0,bottom: 10.0),
  );
}
