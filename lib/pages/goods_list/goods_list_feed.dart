//import 'package:app/apifetch/feed_goods_api.dart';
//import 'package:common_utils/common_utils.dart' as commonUtils;
//import 'package:flutter/material.dart';
//
//import 'package:app/utils/log_util.dart';
//
//import 'package:app/models/goods.dart';
//import 'package:app/utils/navigator_util.dart';
//
////import 'package:app/widgets/v_empty_view.dart';
//import 'package:app/widgets/widget_banner.dart';
//import 'package:app/widgets/widget_future_builder.dart';
//
////import 'package:flutter_screenutil/flutter_screenutil.dart';
////import 'package:provider/provider.dart';
//import 'package:app/models/index_home.dart';
//import 'package:app/apifetch/home_index_json.dart';
//import 'package:app/apifetch/material_goods_api.dart';
//import 'package:app/apifetch/filter_goods_api.dart';
//import 'package:app/utils/app_size.dart';
//import 'package:app/generated/l10n.dart';
//
//import 'package:app/utils/number_utils.dart';
//import 'package:app/widgets/widget_goods_list_fsuper.dart';
//import 'package:app/widgets/widget_lite.dart';
//
//class FeedGoodsList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
//      return FeedGoodsAPI.fetch(pageSize: 5);
//    }, builder: (context, snapshot) {
//      var data = snapshot;
//      return ListView.separated(
//        separatorBuilder: (context, index) {
//          return buildMiddleMargin();
//        },
////        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//        itemBuilder: (context, index) {
//          String _text = data[index].goodsTitleS.isEmpty
//              ? data[index].goodsTitle
//              : data[index].goodsTitleS;
////          String _subText = data[index].goodsSales.toString().isEmpty
////              ? "${data[index].goodsIntroduce ?? ""}"
////              : "已售${NumberUtils.amountConversion(data[index].goodsSales)}";
//          String _subText = (data[index].goodsIntroduce == null ||
//              data[index].goodsIntroduce == "")
//              ? ""
//              : data[index].goodsIntroduce;
//          return GoodsListWidgetFSuper(
//            text: _text,
//            picUrl: data[index].goodsPic,
//            subText: data[index].goodsIntroduce ?? _subText, //,
//            quanMoney: data[index].quanMoney,
//            quanEndPrice: data[index].quanEndPrice,
//            goodsPrice: data[index].goodsPrice,
//            goodsSales: data[index].goodsSales,
//            maxLines: 2,
//            onTap: () {
//              NavigatorUtil.goodsDetails(context, data: data[index]);
//            },
//          );
//        },
//        shrinkWrap: true,
//        physics: NeverScrollableScrollPhysics(),
////        scrollDirection: Axis.vertical,
//        itemCount: data.length,
//      );
//    });
//  }
//}
//
////
////class FeedGoodsList extends StatefulWidget {
////  @override
////  _FeedGoodsListState createState() => _FeedGoodsListState();
////}
////
////class _FeedGoodsListState extends State<FeedGoodsList>
////    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
////  bool _isLoading = true;
////
////  /// 构建10-99
////  Widget _buildFeedGoodsListFSuper() {
////    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
////      return FeedGoodsAPI.fetch(pageSize: 5);
////    }, builder: (context, snapshot) {
////      var data = snapshot;
////      return ListView.separated(
////        separatorBuilder: (context, index) {
////          return buildMiddleMargin();
////        },
//////        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
////        itemBuilder: (context, index) {
////          String _text = data[index].goodsTitleS.isEmpty
////              ? data[index].goodsTitle
////              : data[index].goodsTitleS;
//////          String _subText = data[index].goodsSales.toString().isEmpty
//////              ? "${data[index].goodsIntroduce ?? ""}"
//////              : "已售${NumberUtils.amountConversion(data[index].goodsSales)}";
////          String _subText = (data[index].goodsIntroduce == null ||
////                  data[index].goodsIntroduce == "")
////              ? ""
////              : data[index].goodsIntroduce;
////          return GoodsListWidgetFSuper(
////            text: _text,
////            picUrl: data[index].goodsPic,
////            subText: data[index].goodsIntroduce ?? _subText, //,
////            quanMoney: data[index].quanMoney,
////            quanEndPrice: data[index].quanEndPrice,
////            goodsPrice: data[index].goodsPrice,
////            goodsSales: data[index].goodsSales,
////            maxLines: 2,
////            onTap: () {
////              NavigatorUtil.goodsDetails(context, data: data[index]);
////            },
////          );
////        },
////        shrinkWrap: true,
////        physics: NeverScrollableScrollPhysics(),
//////        scrollDirection: Axis.vertical,
////        itemCount: data.length,
////      );
////    });
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    super.build(context);
////    return _buildFeedGoodsListFSuper();
////  }
////
//////  @override
//////  void initState() {
//////    // TODO: implement initState
//////    super.initState();
//////  }
////
////  @override
////  bool get wantKeepAlive => true;
////}
