import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fsuper/fsuper.dart';
import 'package:app/utils/app_size.dart';
import 'package:app/utils/number_utils.dart';

///纵向卡片，首页（最新更新）
class GoodsListWidgetFSuper extends StatelessWidget {
  final String picUrl;
  final String text;
  final String subText;
  final num goodsSales;
  final int maxLines;
  final int quanMoney;
  final double quanEndPrice;
  final double goodsPrice;
  final double width;
  final double height;
  final VoidCallback onTap;
  final int index;

  GoodsListWidgetFSuper({
    this.picUrl,
    @required this.text,
    this.goodsSales,
    this.subText,
    this.onTap,
    this.maxLines = -1,
    this.quanMoney=0,
    this.quanEndPrice=0.0,
    this.goodsPrice=0.0,
    this.width = 200.0,
    this.height = 200.0,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: FSuper(
        height: AppSize.height(220), //
        padding: EdgeInsets.fromLTRB(12 + 12 + AppSize.height(220), 0, 0, 0),
        text: "$text",
        textSize: AppSize.sp(23.0),
//        textColor: Colors.black.white.withOpacity(0.2),
        textAlignment: Alignment.centerLeft,
        textAlign: TextAlign.left,
        spans: [
          FSuper.VerticalSpace(8),
          TextSpan(
            text: (subText.isEmpty) ? '' : '$subText\n',
            style: TextStyle(
                fontSize: AppSize.sp(20.0),
                color: Colors.grey, //Color(0xffb8b4b8),
                fontWeight: FontWeight.normal),
          ),
          TextSpan(
            text: (goodsSales == null || goodsSales <= 0)
                ? ''
                : '已售：${NumberUtils.amountConversion(goodsSales)}件',
            style: TextStyle(
              fontSize: AppSize.sp(20.0),
              height: 1.5,
              color: Colors.grey, //Color(0xffb8b4b8),
//              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        corner: Corner.all(10),
//        backgroundColor: Colors.white.withOpacity(0.1),
        margin: EdgeInsets.only(left: 12, right: 12),
        strokeColor: Colors.grey,
        strokeWidth: 0.2,
//        shadowColor: Colors.white.withOpacity(0.2),
//        shadowBlur: 1,
        child1: Container(
          width: AppSize.width(220),
          height: AppSize.width(220),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "$picUrl",
              ),
            ),
          ),
        ),
        child1Alignment: Alignment.centerLeft,
        child1Margin: EdgeInsets.only(left: 12),
        child2: FSuper(
          text: '¥${quanEndPrice > 0 ? quanEndPrice : goodsPrice}',
//          textColor: Colors.grey, // Color(0xffc2bfc2),
        textColor: Colors.red.withOpacity(0.8),
          textSize: AppSize.sp(25.0),
          padding: EdgeInsets.all(2),
//            margin: EdgeInsets.all(5),
          corner: Corner.all(3),
          strokeColor: Colors.grey, // Color(0xffc2bfc2),
          strokeWidth: 0.2,
          margin: EdgeInsets.all(5),
        ),
        child2Alignment: Alignment.bottomRight,
        child2Margin: EdgeInsets.all(5),
      ),
    );
  }
}


///横向卡片，首页（好券直播、热卖榜单）
class GoodsListWidgetFSuperEx extends StatelessWidget {
  final String picUrl;
  final String text;
  final String subText;
  final num goodsSales;
  final int maxLines;
  final int quanMoney;
  final double quanEndPrice;
  final double goodsPrice;
  final double width;
  final double height;
  final VoidCallback onTap;
  final int index;

  GoodsListWidgetFSuperEx({
    this.picUrl,
    @required this.text,
    this.goodsSales,
    this.subText,
    this.onTap,
    this.maxLines = -1,
    this.quanMoney=0,
    this.quanEndPrice=0.0,
    this.goodsPrice=0.0,
    this.width = 200.0,
    this.height = 200.0,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: FSuper(
        maxWidth: AppSize.width(width + 50),
        padding: EdgeInsets.fromLTRB(3, AppSize.height(height) + 10, 3, 0), //
        text: "$text",
        textSize: AppSize.sp(23.0),
//        textColor: Colors.black,
        textAlignment: Alignment.centerLeft,
        textAlign: TextAlign.left,
        spans: [
          FSuper.VerticalSpace(8),
          TextSpan(
              text: '$subText',
              style: TextStyle(
                  fontSize: AppSize.sp(20.0),
                  color: Colors.grey, //Color(0xffb8b4b8),
                  fontWeight: FontWeight.normal)),
        ],
        corner: Corner.all(10),
//        backgroundColor: Colors.white.withOpacity(0.2),
        margin: EdgeInsets.only(left: 3, right: 3),
        strokeColor: Colors.grey,
        strokeWidth: 0.2,
//        shadowColor: Colors.black.withOpacity(0.2),
//        shadowBlur: 1,
        child1: Container(
          width: AppSize.width(220),
          height: AppSize.width(220),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "$picUrl",
              ),
            ),
          ),
        ),
        child1Alignment: Alignment.topCenter,
        child1Margin: EdgeInsets.only(left: 0),

        child2: FSuper(
          text: '¥${quanEndPrice > 0 ? quanEndPrice : goodsPrice}',
          textColor: Colors.red.withOpacity(0.8),
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(5),
          corner: Corner.all(3),
          strokeColor: Colors.grey, //Color(0xffc2bfc2),
          strokeWidth: 0.2,
        ),
        child2Alignment: Alignment.bottomRight,
        child2Margin: EdgeInsets.all(5),
      ),
    );
  }
}
