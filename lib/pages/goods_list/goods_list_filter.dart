import 'package:app/apifetch/filter_goods_api.dart';
import 'package:flutter/material.dart';

import 'package:app/utils/log_util.dart';

import 'package:app/models/goods.dart';
import 'package:app/utils/navigator_util.dart';

import 'package:app/utils/app_size.dart';

import 'package:app/utils/number_utils.dart';
import 'package:app/widgets/widget_goods_list_fsuper.dart';
import 'package:app/widgets/widget_lite.dart';

class FilterGoodsList extends StatefulWidget {
  final int price;
  final int pricemax;
  final int sales;
  FilterGoodsList({this.price = 0, this.pricemax = 10, this.sales = 10000});
  @override
  _FilterGoodsListState createState() => _FilterGoodsListState();
}

class _FilterGoodsListState extends State<FilterGoodsList>
    with AutomaticKeepAliveClientMixin {
  List<GoodsItem> _goodsList = List();
  int _pageSize = 10;
  ScrollController _scrollController = ScrollController();

  int _pageNum = 1;

  @override
  void initState() {
    super.initState();
    _loadData(isNew: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return _buildGoodsList();
  }

  void _loadData({bool isNew = false}) async {
    FilterGoodsAPI.fetch(
            price: widget.price,
            pricemax: widget.pricemax,
            sales: widget.sales,
            pageSize: _pageSize)
        .then((value) {
      if (mounted && value != null && value.length > 0) {
        _goodsList.clear();
        setState(() {
          _goodsList = value;
        });
      }
    });
  }

  Widget _buildGoodsList() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return buildSmallMargin();
      },
      controller: _scrollController,
      itemBuilder: (context, index) {
        String _text = _goodsList[index].goodsTitleS;
        String _subText = (_goodsList[index].goodsIntroduce == null ||
                _goodsList[index].goodsIntroduce == "")
            ? ""
            : _goodsList[index].goodsIntroduce;

        return GoodsListWidgetFSuper(
          text: _text,
          picUrl: _goodsList[index].goodsPic,
          subText: _goodsList[index].goodsIntroduce ?? _subText, //,
          quanMoney: _goodsList[index].quanMoney,
          quanEndPrice: _goodsList[index].quanEndPrice,
          goodsPrice: _goodsList[index].goodsPrice,
          goodsSales: _goodsList[index].goodsSales,
          maxLines: 2,
          onTap: () {
            NavigatorUtil.goodsDetails(context, data: _goodsList[index]);
          },
        );
      },
      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
      itemCount: _goodsList.length,
    );
  }
}
