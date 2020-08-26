import 'package:flutter/material.dart';

import 'package:app/utils/log_util.dart';

import 'package:app/models/goods.dart';
import 'package:app/utils/navigator_util.dart';

import 'package:app/widgets/widget_future_builder.dart';

import 'package:app/apifetch/material_goods_api.dart';

import 'package:app/utils/app_size.dart';

import 'package:app/utils/number_utils.dart';
import 'package:app/widgets/widget_goods_list_fsuper.dart';
import 'package:app/widgets/widget_lite.dart';

class DiscoverMaterialGoodsList extends StatelessWidget {
  final String id;
  DiscoverMaterialGoodsList({this.id = '3756'});
  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
      return MaterialGoodsAPI.fetch("$id", pageNum: 0, pageSize: 10);
    }, builder: (context, snapshot) {
      var data = snapshot;
      return Container(
          height: AppSize.height(360),
//          width:ScreenUtil().setWidth(360),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return buildSmallMargin();
            },
            itemBuilder: (context, index) {
              String _text = data[index].goodsTitleS.isEmpty
                  ? data[index].goodsTitle
                  : data[index].goodsTitleS;
              String _subText = data[index].goodsSales.toString().isEmpty
                  ? "${data[index].goodsIntroduce ?? ""}"
                  : "已售${NumberUtils.amountConversion(data[index].goodsSales)}"; //{data[index].goodsSales.toString()}件
              return GoodsListWidgetFSuperEx(
                text: _text,
                picUrl: data[index].goodsPic,
                subText: _subText, //data[index].goodsIntroduce ?? "",
                quanMoney: data[index].quanMoney,
                quanEndPrice: data[index].quanEndPrice,
                goodsPrice: data[index].goodsPrice,
//                goodsSales: data[index].goodsSales,
                maxLines: 2,
                onTap: () {
                  NavigatorUtil.goodsDetails(context, data: data[index]);
                },
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
          ));
    });
  }
}
