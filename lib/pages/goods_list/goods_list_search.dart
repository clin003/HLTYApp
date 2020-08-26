import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'package:app/models/goods.dart';

import 'package:app/apifetch/search_goods_api.dart';

import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/number_utils.dart';
import 'package:app/utils/navigator_util.dart';

import 'package:app/widgets/widget_lite.dart';

import 'package:fsuper/fsuper.dart';
import 'package:app/widgets/widget_goods_list_fsuper.dart';
//import 'package:frefresh/frefresh.dart';

///
/// 搜索商品列表
///
String _searchText = '';
int _num = 0;
int _pageNum = 1;

class SearchGoodsList extends StatefulWidget {
  final String id;
  final String query;

  SearchGoodsList({this.id = "17004", this.query = ''});

  @override
  _SearchGoodsListState createState() => _SearchGoodsListState();
}

class _SearchGoodsListState extends State<SearchGoodsList> {
  List<GoodsItem> _goodsList = List();
//  int _pageNum = 1;
  int _pageSize = 10;
  bool _isLoadMaxNum = false;

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    _num = 0;
    _searchText = (widget.query != null) ? '${widget.query}' : '';
    if (mounted) {
      _loadData(isNew: true);
    }
    LogUtil.v('SearchGoodsList>>initState(widget.query):${widget.query}');
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadData({bool isNew = false}) async {
    LogUtil.v(
        'SearchGoodsList>>loadData(widget.query):${widget.query},(_pageNum)$_pageNum');
    List<GoodsItem> entity = await SearchGoodsAPI.fetch(
        materialId: widget.id,
        query: widget.query,
        pageNum: _pageNum,
        pageSize: _pageSize);
    if (mounted && entity != null && entity.length > 0) {
//      _pageNum = _pageNum + 1;
      if (isNew) {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
        _pageNum = 1;
        _goodsList.clear();
      }
      setState(() {
        _goodsList.addAll(entity);
      });
    }
    _pageNum = _pageNum + 1;
    LogUtil.v(
        'SearchGoodsList>>loadData(End)(_goodsList.length):${_goodsList.length},(_pageNum)$_pageNum');
  }

  void _refreshData() async {
    String tmpText = (widget.query != null) ? '${widget.query}' : '';
    if (_searchText != tmpText && tmpText != '' && _searchText != '') {
      _num++;
      _searchText = tmpText;
      _pageNum = 1;
      _loadData(isNew: true);
    }
    if (_searchText == '') {
      _searchText = tmpText;
      if (_searchText != '') {
        _num++;
        _pageNum = 1;
        _loadData(isNew: true);
      }
    }
//    LogUtil.v(
//        'SearchGoodsList>>_refreshData(_num):$_num,(tmpText)$tmpText,(_searchText)$_searchText');
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

  Widget _buildGoodsList() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return buildSmallMargin();
      },
      controller: _scrollController,
      itemBuilder: (context, index) {
        String _text = _goodsList[index].goodsTitle;
        String _subText = (_goodsList[index].goodsIntroduce == null ||
                _goodsList[index].goodsIntroduce == "")
            ? ""
            : _goodsList[index].goodsIntroduce;
        if ((_goodsList.length - 2) < index && index < 200) {
          _loadData();
        }
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

  Widget _buildNotice() {
    return FSuper(
      text: '我是有底线的！',
    );
  }

  @override
  Widget build(BuildContext context) {
    _refreshData();
    LogUtil.v('SearchGoodsList>>build(widget.query):${widget.query}');
    return _buildGoodsList();
  }
}
