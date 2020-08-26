import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app/models/goods.dart';

import 'package:app/apifetch/material_goods_api.dart';

import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/number_utils.dart';
import 'package:app/utils/navigator_util.dart';

import 'package:app/widgets/widget_lite.dart';

import 'package:fsuper/fsuper.dart';
import 'package:app/widgets/widget_goods_list_fsuper.dart';

///
/// 相似商品列表
///
class SimilarGoodsList extends StatefulWidget {
  final String id;

  SimilarGoodsList(this.id);

  @override
  _SimilarGoodsListState createState() => _SimilarGoodsListState();
}

class _SimilarGoodsListState extends State<SimilarGoodsList> {
  List<GoodsItem> _goodsList = List();

  @override
  void initState() {
//    isLike = false;

    if (mounted) {
      loadData();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadData() async {
    List<GoodsItem> entity =
        await MaterialGoodsAPI.fetch("13256", itemId: widget.id);
    if (entity.length > 0 && mounted) {
      _goodsList.clear();
      setState(() {
        _goodsList = entity;
      });
    }
  }

//  Widget _buildGuestGoodsList() {
//    LogUtil.e('_buildGuestGoodsList:${_goodsList.length}');
//    return (_goodsList.length < 1)
//        ? Container()
//        : GridView.builder(
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2, childAspectRatio: 1.0),
//            itemCount: _goodsList.length,
//            itemBuilder: (context, index) {
//              String _text = _goodsList[index].goodsTitleS.isEmpty
//                  ? _goodsList[index].goodsTitle
//                  : _goodsList[index].goodsTitleS;
//              String _subText = _goodsList[index].goodsSales.toString().isEmpty
//                  ? "${_goodsList[index].goodsIntroduce ?? ""}"
//                  : "已售${NumberUtils.amountConversion(_goodsList[index].goodsSales)}"; //{data[index].goodsSales.toString()}件
//              return GoodsListWidgetFSuperEx(
//                text: _text,
//                picUrl: _goodsList[index].goodsPic,
//                subText: _subText, //data[index].goodsIntroduce ?? "",
//                quanMoney: _goodsList[index].quanMoney,
//                quanEndPrice: _goodsList[index].quanEndPrice,
//                goodsPrice: _goodsList[index].goodsPrice,
////                goodsSales: data[index].goodsSales,
//                maxLines: 2,
//                onTap: () {
//                  NavigatorUtil.goodsDetails(context, data: _goodsList[index]);
//                },
//              );
//            });
//  }

  Widget _buildSimilarGoodsList() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return buildSmallMargin();
      },
//        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
      itemBuilder: (context, index) {
        String _text = _goodsList[index].goodsTitle;
        String _subText = _goodsList[index].goodsSales.toString().isEmpty
            ? "${_goodsList[index].goodsIntroduce ?? ""}"
            : "已售${NumberUtils.amountConversion(_goodsList[index].goodsSales)}"; //{data[index].goodsSales.toString()}件
        return GoodsListWidgetFSuper(
          text: _text,
          picUrl: _goodsList[index].goodsPic,
          subText: _goodsList[index].goodsIntroduce ?? _subText, //,
          quanMoney: _goodsList[index].quanMoney,
          quanEndPrice: _goodsList[index].quanEndPrice,
          goodsPrice: _goodsList[index].goodsPrice,
//                goodsSales: data[index].goodsSales,
          maxLines: 2,
          onTap: () {
            NavigatorUtil.goodsDetails(context, data: _goodsList[index]);
          },
        );
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
//        scrollDirection: Axis.vertical,
      itemCount: _goodsList.length,
    );
  }

  Widget _buildSimilarTitle() {
    return FSuper(
      text: (_goodsList.length > 0) ? "相似宝贝" : "",
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Container(
      child: Column(
        children: [
          _buildSimilarTitle(),
          buildSmallMargin(),
          _buildSimilarGoodsList(),
        ],
      ),
    );
  }
}
