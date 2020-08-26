import 'package:flutter/material.dart';

import 'package:app/utils/log_util.dart';

import 'package:app/models/goods.dart';
import 'package:app/utils/navigator_util.dart';

import 'package:app/apifetch/material_goods_api.dart';

import 'package:app/utils/app_size.dart';

import 'package:app/utils/number_utils.dart';
import 'package:app/widgets/widget_goods_list_fsuper.dart';
import 'package:app/widgets/widget_lite.dart';

//String _materialID = '';
//int _num = 0;
//int _pageNum = 1;

class MaterialIdGoodsList extends StatefulWidget {
  final String id;
  final String title;
  final int totalResults;
  MaterialIdGoodsList(
      {this.id = '3756', this.title = '', this.totalResults = 200});
  @override
  _MaterialIdGoodsListState createState() => _MaterialIdGoodsListState();
}

class _MaterialIdGoodsListState extends State<MaterialIdGoodsList>  with AutomaticKeepAliveClientMixin{
  List<GoodsItem> _goodsList = List();
//  int _pageNum = 1;
  int _pageSize = 20;
  bool _isLoadMaxNum = false;
  ScrollController _scrollController = ScrollController();

  String _materialID = '';
  int _num = 0;
  int _pageNum = 1;

  @override
  void initState() {
    super.initState();
//    _materialID = (widget.id != null) ? '${widget.id}' : '';
    _loadData(isNew: true);
//    if (mounted) {
//      _loadData(isNew: true);
//    }
//    LogUtil.v('MaterialIdGoodsList>>initState(widget.id):${widget.id}');
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
//    _refreshData();
    LogUtil.v('MaterialIdGoodsList>>build(widget.id):${widget.id}\n'
        '(widget.name):${widget.title}');
    return _buildGoodsList();
  }

  void _loadData({bool isNew = false}) async {
//    LogUtil.v('MaterialIdGoodsList>>loadData(Start)\n'
//        '(widget.id):${widget.id},(widget.title):${widget.title},(_goodsList.length):${_goodsList.length},\n'
//        '(_pageNum)$_pageNum,(_pageSize)$_pageSize\n'
//        '(widget.totalResults)${widget.totalResults}');
//    List<GoodsItem> entity = await MaterialGoodsAPI.fetch("${widget.id}",
//        pageNum: _pageNum, pageSize: _pageSize);
//    if (mounted && entity != null && entity.length > 0) {
////      _pageNum = _pageNum + 1;
//      if (isNew) {
//        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
//        _pageNum = 1;
//        _goodsList.clear();
//        LogUtil.v('MaterialIdGoodsList>>loadData(isNew)$isNew,清理历史商品\n');
//      }
//      setState(() {
//        _goodsList.addAll(entity);
//      });
//    }
//    _pageNum = _pageNum + 1;
//    LogUtil.v('MaterialIdGoodsList>>loadData(End)\n'
//        '(widget.id):${widget.id},(widget.title):${widget.title},(_goodsList.length):${_goodsList.length},\n'
//        '(_pageNum)$_pageNum,(_pageSize)$_pageSize\n'
//        '(widget.totalResults)${widget.totalResults}');

    MaterialGoodsAPI.fetch("${widget.id}",
            pageNum: _pageNum, pageSize: _pageSize)
        .then((value) {
      if (mounted && value != null && value.length > 0) {
//      _pageNum = _pageNum + 1;
        if (isNew) {
          _scrollController.jumpTo(_scrollController.position.minScrollExtent);
          _pageNum = 1;
          _goodsList.clear();
          LogUtil.v('MaterialIdGoodsList>>loadData(isNew)$isNew,清理历史商品\n');
        }
        setState(() {
          _goodsList.addAll(value);
        });
      }
      _pageNum = _pageNum + 1;
      LogUtil.v('MaterialIdGoodsList>>loadData(End)\n'
          '(widget.id):${widget.id},(widget.title):${widget.title},(_goodsList.length):${_goodsList.length},\n'
          '(_pageNum)$_pageNum,(_pageSize)$_pageSize\n'
          '(widget.totalResults)${widget.totalResults}');
    });
  }
//  void _loadData({bool isNew = false}) async {
//    LogUtil.v('MaterialIdGoodsList>>loadData(Start)\n'
//        '(widget.id):${widget.id},(widget.title):${widget.title},(_goodsList.length):${_goodsList.length},\n'
//        '(_pageNum)$_pageNum,(_pageSize)$_pageSize\n'
//        '(widget.totalResults)${widget.totalResults}');
//    List<GoodsItem> entity = await MaterialGoodsAPI.fetch("${widget.id}",
//        pageNum: _pageNum, pageSize: _pageSize);
//    if (mounted && entity != null && entity.length > 0) {
////      _pageNum = _pageNum + 1;
//      if (isNew) {
//        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
//        _pageNum = 1;
//        _goodsList.clear();
//        LogUtil.v('MaterialIdGoodsList>>loadData(isNew)$isNew,清理历史商品\n');
//      }
//      setState(() {
//        _goodsList.addAll(entity);
//      });
//    }
//    _pageNum = _pageNum + 1;
//    LogUtil.v('MaterialIdGoodsList>>loadData(End)\n'
//        '(widget.id):${widget.id},(widget.title):${widget.title},(_goodsList.length):${_goodsList.length},\n'
//        '(_pageNum)$_pageNum,(_pageSize)$_pageSize\n'
//        '(widget.totalResults)${widget.totalResults}');
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

        if ((_goodsList.length - 2) < index &&
            index <= widget.totalResults &&
            _pageNum < 100) {
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
}
