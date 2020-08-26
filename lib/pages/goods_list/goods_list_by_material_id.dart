//import 'package:flutter/material.dart';
//import 'package:app/utils/common.dart';
//import 'package:app/apifetch/material_goods_api.dart';
//
//import 'package:app/models/goods.dart';
//import 'package:app/widgets/load_state_layout.dart';
//
//import 'package:app/res/colours.dart';
//import 'package:flutter_easyrefresh/easy_refresh.dart';
//
//import 'package:app/utils/app_size.dart';
//
//import 'package:app/view/theme_ui.dart';
//import 'package:flutter_easyrefresh/material_header.dart';
//import 'package:flutter_easyrefresh/material_footer.dart';
//
//import 'card_goods.dart';
//
///// 物料商品列表页面
//class MaterialGoodsListView extends StatefulWidget {
//  final int currentPage;
//  final String id;
//  final String name;
//
////  final List<CategoryInfoModel> categoryInfoModels;
//
//  /// 0,表示推荐
//  /// 1，表示分类
//  final HomeData topic;
//
//  MaterialGoodsListView({
//    this.currentPage,
//    this.id,
//    this.name,
////      this.categoryInfoModels,
//    @required this.topic,
//  });
//
//  @override
//  _MaterialGoodsListViewState createState() => _MaterialGoodsListViewState();
//}
//
//class _MaterialGoodsListViewState extends State<MaterialGoodsListView>
//    with AutomaticKeepAliveClientMixin {
//  GlobalKey _headerKey = GlobalKey();
//  GlobalKey _footerKey = GlobalKey();
//  LoadState _layoutState = LoadState.State_Loading;
//  List<GoodsItem> goodsList = new List<GoodsItem>(); //GoodsList
//
//  bool _isLoading = false;
//
//  @override
//  void initState() {
//    _isLoading = true;
//    loadData(widget.id);
////    if(widget.topic==HomeData.topic){
////      loadTopicData();
////    }
//    if (widget.topic == HomeData.cateGory) {
////      loadData(widget.id);
//    }
//    super.initState();
//  }
//
//  ///加载分类数据
//
//  void loadData(String id) async {
//    List<GoodsItem> entity = await MaterialGoodsAPI.fetch(id);
//    if (entity != null) {
//      if (mounted) {
//        setState(() {
//          goodsList.clear();
//          goodsList = entity;
//          _isLoading = false;
//          if (goodsList.length > 0) {
//            _layoutState = LoadState.State_Success;
//          } else {
//            _layoutState = LoadState.State_Empty;
//          }
//        });
//      }
//    } else {
//      setState(() {
//        _layoutState = LoadState.State_Error;
//      });
//    }
//  }
//
//  Widget _getData() {
//    return goodsList.length > 0
//        ? Container(
//            child: Column(
//              children: <Widget>[
//                Container(
//                    color: Colours.white,
//                    width: double.infinity,
//                    margin: EdgeInsets.only(top: 10),
//                    height: AppSize.height(94),
//                    padding: EdgeInsets.only(left: 10, top: 7),
//                    child: Text(
//                      '${widget.name}',
//                      style: ThemeTextStyle.orderFormTitleStyle,
//                    )),
//                ThemeView.divider(),
//                CardGoods(goodsModleDataList: goodsList)
//              ],
//            ),
//          )
//        : Container();
//  }
////  Widget _buildNewGoodsList() {
////    return Container(
////        height: ScreenUtil().setWidth(300),
////        child: ListView.separated(
//////          separatorBuilder: (context, index) {
//////            return HEmptyView(ScreenUtil().setWidth(30));
//////          },
////          padding:
////          EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
////          itemBuilder: (context, index) {
////            return GoodsListWidget(
////              text: data[index].goodsTitle,
////              picUrl: data[index].goodsPic,
////              playCount: data[index].goodsSales,
////              maxLines: 2,
////              onTap: () {
////                NavigatorUtil.goPlayListPage(context, data: data[index]);
////              },
////            );
////          },
////          shrinkWrap: true,
////          scrollDirection: Axis.horizontal,
////          itemCount: data.length,
////        ));
////  }
//
//  Widget _getContent() {
//    if (_isLoading) {
//      return Center(
//        child: CircularProgressIndicator(),
//      );
//    } else {
//      return Container(
//        padding: EdgeInsets.only(
//            top: AppSize.width(30),
//            left: AppSize.width(30),
//            right: AppSize.width(30)),
//        child: EasyRefresh(
//            header: MaterialHeader(
//              key: _headerKey,
//            ),
//            footer: MaterialFooter(
//              key: _footerKey,
//            ),
//            child: _getData(),
//            onRefresh: () async {
//              _isLoading = true;
//              loadData(widget.id);
////              if (widget.topic == HomeData.topic) {
////                loadTopicData();
////              }
////              if (widget.topic == HomeData.cateGory) {
////                loadData(widget.id);
////              }
//            },
//            onLoad: () async {}),
//      );
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return LoadStateLayout(
//        state: _layoutState,
//        errorRetry: () {
//          setState(() {
//            _layoutState = LoadState.State_Loading;
//          });
//          loadData(widget.id);
////          if (widget.topic == HomeData.topic) {
////            loadTopicData();
////          }
////          if (widget.topic == HomeData.cateGory) {
////            loadData(widget.id);
////          }
//        }, //错误按钮点击过后进行重新加载
//        successWidget: _getContent());
//  }
//
//  @override
//  bool get wantKeepAlive => true;
//}
