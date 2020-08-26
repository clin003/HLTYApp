import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/utils/number_utils.dart';
import 'package:app/utils/utils.dart';

/// 榜单、新品等封面组件
class GoodsListCoverWidget extends StatelessWidget {
  final String url;
  final int salesCount;
  final double width;
  final double height;
  final double radius;

  GoodsListCoverWidget(this.url,
      {this.salesCount, this.width = 200, this.height, this.radius = 16});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(radius))),
      child: Container(
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setWidth(height ?? width),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Utils.showNetImage('$url', width: ScreenUtil().setWidth(width), height: ScreenUtil().setWidth(height ?? width), fit: BoxFit.cover),
            salesCount == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(2),
                        right: ScreenUtil().setWidth(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/icon/icon_event_video_bar.png',
                          width: ScreenUtil().setWidth(30),
                          height: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          '已售${NumberUtils.amountConversion(salesCount)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
