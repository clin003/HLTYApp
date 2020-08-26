import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/common_text_style.dart';
import 'package:app/utils/number_utils.dart';
import 'package:app/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/widgets/widget_goods_list_cover.dart';
import 'package:fsuper/fsuper.dart';

/// 榜单、新品等封装的组件
class GoodsListWidget extends StatelessWidget {
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

  GoodsListWidget({
    this.picUrl,
    @required this.text,
    this.goodsSales,
    this.subText,
    this.onTap,
    this.maxLines = -1,
    this.quanMoney,
    this.quanEndPrice,
    this.goodsPrice,
    this.width = 200.0,
    this.height = 200.0,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    Widget _price;
    Widget _priceEmptyView;
    if ((quanMoney ?? 0) > 0) {
      _priceEmptyView = VEmptyView(2);
      _price = Text.rich(TextSpan(children: [
        TextSpan(
          text: "券后",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        TextSpan(
          text: "¥",
          style: TextStyle(
            color: Colors.red,
            fontSize: 10,
          ),
        ),
        TextSpan(
          text: "$quanEndPrice",
          style: TextStyle(color: Colors.red),
        ),
        TextSpan(
          text: "¥",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              decoration: TextDecoration.lineThrough),
        ),
        TextSpan(
          text: "$goodsPrice",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              decoration: TextDecoration.lineThrough),
        ),
      ]));
    } else if ((goodsPrice ?? 0) > 0) {
      _priceEmptyView = VEmptyView(2);
      _price = Text.rich(TextSpan(children: [
        TextSpan(
          text: "¥",
          style: TextStyle(
            color: Colors.red,
            fontSize: 10,
          ),
        ),
        TextSpan(
          text: "$goodsPrice",
          style: TextStyle(color: Colors.red),
        ),
      ]));
    } else {
      _priceEmptyView = Container();
      _price = Container();
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            picUrl == null
                ? Container()
                : GoodsListCoverWidget(
                    picUrl,
                    salesCount: goodsSales,
                    width: width,
                    height: height,
                  ),
            index == null
                ? Container()
                : Text(
                    index.toString(),
                    style: commonGrayTextStyle,
                  ),
            VEmptyView(5),
            Text(
              text,
              style: smallCommonTextStyle,
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
            _priceEmptyView,
            _price,
            subText == null ? Container() : VEmptyView(2),
            subText == null
                ? Container()
                : Text(
                    subText,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                    maxLines: maxLines != -1 ? maxLines : null,
                    overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
                  ),
          ],
        ),
      ),
    );
  }
}
//
//class GoodsListWidgetFSuper extends StatelessWidget {
//  final String picUrl;
//  final String text;
//  final String subText;
//  final num goodsSales;
//  final int maxLines;
//  final int quanMoney;
//  final double quanEndPrice;
//  final double goodsPrice;
//  final double width;
//  final double height;
//  final VoidCallback onTap;
//  final int index;
//
//  GoodsListWidgetFSuper({
//    this.picUrl,
//    @required this.text,
//    this.goodsSales,
//    this.subText,
//    this.onTap,
//    this.maxLines = -1,
//    this.quanMoney,
//    this.quanEndPrice,
//    this.goodsPrice,
//    this.width = 200.0,
//    this.height = 200.0,
//    this.index,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    Widget _price;
//    Widget _priceEmptyView;
//    if ((quanMoney ?? 0) > 0) {
//      _priceEmptyView = VEmptyView(2);
//      _price = Text.rich(TextSpan(children: [
//        TextSpan(
//          text: "券后",
//          style: TextStyle(
//            color: Colors.grey,
//            fontSize: 10,
//          ),
//        ),
//        TextSpan(
//          text: "¥",
//          style: TextStyle(
//            color: Colors.red,
//            fontSize: 10,
//          ),
//        ),
//        TextSpan(
//          text: "$quanEndPrice",
//          style: TextStyle(color: Colors.red),
//        ),
//        TextSpan(
//          text: "¥",
//          style: TextStyle(
//              color: Colors.grey,
//              fontSize: 10,
//              decoration: TextDecoration.lineThrough),
//        ),
//        TextSpan(
//          text: "$goodsPrice",
//          style: TextStyle(
//              color: Colors.grey,
//              fontSize: 10,
//              decoration: TextDecoration.lineThrough),
//        ),
//      ]));
//    } else if ((goodsPrice ?? 0) > 0) {
//      _priceEmptyView = VEmptyView(2);
//      _price = Text.rich(TextSpan(children: [
//        TextSpan(
//          text: "¥",
//          style: TextStyle(
//            color: Colors.red,
//            fontSize: 10,
//          ),
//        ),
//        TextSpan(
//          text: "$goodsPrice",
//          style: TextStyle(color: Colors.red),
//        ),
//      ]));
//    } else {
//      _priceEmptyView = Container();
//      _price = Container();
//    }
//
//    return GestureDetector(
//      behavior: HitTestBehavior.translucent,
//      onTap: onTap,
//      child: FSuper(
//        height: ScreenUtil().setHeight(220), //
//        padding:
//            EdgeInsets.fromLTRB(12 + 12 + ScreenUtil().setHeight(220), 0, 0, 0),
//        text: "$text",
//        textSize: ScreenUtil().setSp(23.0),
//        textColor: Colors.black,
//        textAlignment: Alignment.centerLeft,
//        textAlign: TextAlign.left,
////          textWeight: FontWeight.w500,
//        spans: [
//          FSuper.VerticalSpace(8),
//          TextSpan(
//              text: '$subText',
//              style: TextStyle(
//                  fontSize: ScreenUtil().setSp(20.0),
//                  color: Color(0xffb8b4b8),
//                  fontWeight: FontWeight.normal)),
//        ],
//        corner: Corner.all(10),
//        backgroundColor: Colors.white,
//        margin: EdgeInsets.only(left: 12, right: 12),
//        shadowColor: Colors.black38.withOpacity(0.12),
//        shadowBlur: 5,
//        child1: Container(
//          width: ScreenUtil().setWidth(220),
//          height: ScreenUtil().setWidth(220),
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(10.0),
//            shape: BoxShape.rectangle,
//            image: DecorationImage(
//              fit: BoxFit.cover,
//              image: NetworkImage(
//                "$picUrl",
//              ),
//            ),
//          ),
//        ),
//        child1Alignment: Alignment.centerLeft,
//        child1Margin: EdgeInsets.only(left: 12),
//        onChild1Click: () {
////    _showDialog(context, "HAHAHAHA.. 😄");
//        },
//        child2: FSuper(
//          text: '¥${quanEndPrice > 0 ? quanEndPrice : goodsPrice}',
//          textColor: Color(0xffc2bfc2),
//          padding: EdgeInsets.all(2),
////            margin: EdgeInsets.all(5),
//          corner: Corner.all(3),
//          strokeColor: Color(0xffc2bfc2),
//          strokeWidth: 1,
//        ),
//        child2Alignment: Alignment.bottomRight,
//        child2Margin: EdgeInsets.all(5),
//        onChild2Click: () {
////    _showDialog(context, "HAHAHAHA.. 😄");
//        },
//      ),
//    );
//  }
//}
