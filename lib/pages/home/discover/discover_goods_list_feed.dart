import 'package:app/apifetch/feed_goods_api.dart';
import 'package:app/application.dart';

import 'package:flutter/material.dart';

import 'package:app/utils/log_util.dart';

import 'package:app/models/goods.dart';
import 'package:app/utils/navigator_util.dart';

import 'package:app/widgets/widget_future_builder.dart';

import 'package:app/widgets/widget_goods_list_fsuper.dart';
import 'package:app/widgets/widget_lite.dart';

int _minId = 0;
int _maxId = 0;

class DiscoverFeedGoodsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
      return FeedGoodsAPI.fetch(pageSize: 10); //, maxId: _maxId
    }, builder: (context, snapshot) {
      var data = snapshot;
      return ListView.separated(
        separatorBuilder: (context, index) {
          return buildMiddleMargin();
        },
        itemBuilder: (context, index) {
//          LogUtil.v(
//              'FeedGoodsList>>(index)$index，(data[index].id)${data[index].goodsTime},(_minId)$_minId,(_maxId)$_maxId');
//          LogUtil.v(
//              'FeedGoodsList>>(data[index].goodsTitleS)${data[index].goodsTitleS}');
          if (_minId == 0 || _minId > data[index].goodsTime) {
            _minId = data[index].goodsTime;
          }
          if (_maxId == 0 || _maxId < data[index].goodsTime) {
            _maxId = data[index].goodsTime;
          }
          String _text = data[index].goodsTitleS.isEmpty
              ? data[index].goodsTitle
              : data[index].goodsTitleS;
          String _subText = (data[index].goodsIntroduce == null ||
                  data[index].goodsIntroduce == "")
              ? ""
              : data[index].goodsIntroduce;
          if (data[index].goodsTitleS!=null && data[index].goodsTitleS!=""){
            Application.sp.setString('last_goods_title', '${data[index].goodsTitleS}');
          }
          return GoodsListWidgetFSuper(
            text: _text,
            picUrl: data[index].goodsPic,
            subText: data[index].goodsIntroduce ?? _subText, //,
            quanMoney: data[index].quanMoney,
            quanEndPrice: data[index].quanEndPrice,
            goodsPrice: data[index].goodsPrice,
            goodsSales: data[index].goodsSales,
            maxLines: 2,
            onTap: () {
              NavigatorUtil.goodsDetails(context, data: data[index]);
            },
          );
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
//        scrollDirection: Axis.vertical,
        itemCount: data.length,
      );
    });
  }
}
