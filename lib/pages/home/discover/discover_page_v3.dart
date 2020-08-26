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
//class DiscoverPage extends StatefulWidget {
//  @override
//  _DiscoverPageState createState() => _DiscoverPageState();
//}
//
//class _DiscoverPageState extends State<DiscoverPage>
//    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
//  APPIndexRoot appIndexRoot;
//  List<BannerList> bannerList;
//  List<IconList> iconList;
//  FindProductMaterial findProductMaterial;
//  GuessProductList guessProductList;
//
//  List<GoodsItem> goodsList = new List<GoodsItem>();
//
//  bool _isLoading = true;
//
//  /// 构建轮播图
//  Widget _buildBanner() {
//    return CustomBanner(
//      bannerList.map((e) => '${e.pictUrl}').toList(), //?param=540y210
//      onTap: (index) {
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:$index");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].moreUrl}");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].name}");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].pageId}");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].urlScheme}");
//      },
//    );
//  }
//
//  /// 构建分类列表
//  Widget _buildHomeIconList() {
//    var width = AppSize.width(100);
//    int _crossAxisCount = 5;
//    if (iconList.length > 5) {
//      _crossAxisCount = 5;
//    } else {
//      _crossAxisCount = iconList.length;
//    }
//    return GridView.custom(
//      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
//      padding: EdgeInsets.only(bottom: 10),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: _crossAxisCount,
//        childAspectRatio: 1 / 1.1,
//      ),
//      childrenDelegate: SliverChildBuilderDelegate(
//        (context, index) {
//          return GestureDetector(
//            behavior: HitTestBehavior.translucent,
//            onTap: () {
////              LogUtil.e("<DiscoverPage_V2>构建分类列表:$index");
////              LogUtil.e("<DiscoverPage_V2>构建分类列表:${iconList[index].moreUrl}");
////              LogUtil.e("<DiscoverPage_V2>构建分类列表:${iconList[index].name}");
////              LogUtil.e("<DiscoverPage_V2>构建分类列表:${iconList[index].endTime}");
////              LogUtil.e("<DiscoverPage_V2>构建分类列表:${iconList[index].urlScheme}");
//              switch (index) {
//                case 0:
//                  // NavigatorUtil.goDailySongsPage(context);
//                  break;
//                case 2:
//                  // NavigatorUtil.goTopListPage(context);
//                  break;
//              }
//            },
//            child: Column(
//              children: <Widget>[
//                Stack(
//                  alignment: Alignment.center,
//                  children: <Widget>[
//                    Container(
//                      width: width,
//                      height: width,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(width / 2),
//                          border: Border.all(color: Colors.white70, width: 0.5),
//                          gradient: RadialGradient(
//                            colors: [
//                              Colors.white, // Color(0xFFFF8174),
//                              Colors.white,
//                            ],
//                            center: Alignment(-1.7, 0),
//                            radius: 1,
//                          ),
//                          color: Colors.red),
//                    ),
////                    Image.asset(
////                      map[keys[index]],
////                      width: width,
////                      height: width,
////                    ),
//                    Image.network(
//                      iconList[index].pictUrl,
//                      width: width,
//                      height: width,
//                    ),
//                    Container(
//                      padding: EdgeInsets.only(top: 5),
//                      child: iconList[index].name == '每日推荐'
//                          ? Text(
//                              '${commonUtils.DateUtil.formatDate(DateTime.now(), format: 'dd')}',
//                              style: TextStyle(
//                                  color: Colors.red,
//                                  fontWeight: FontWeight.bold),
//                            )
//                          : Text(''),
//                    )
//                  ],
//                ),
////                VEmptyView(10),
//                buildSmallMargin(),
//                Text(
//                  '${iconList[index].name}',
//                  style: TextStyle(
//                      color: Colors.black87, fontSize: AppSize.sp(28.0)),
//                ),
//              ],
//            ),
//          );
//        },
//        childCount: iconList.length,
//      ),
//    );
//  }
//
//  void loadData(String id) async {
//    List<GoodsItem> entity = await FeedGoodsAPI.fetch(pageSize: 5);
//    if (entity != null) {
//      if (mounted) {
//        setState(() {
//          goodsList.clear();
//          goodsList = entity;
//        });
//      }
//    }
//  }
//
//  /// 构建10-99
//  Widget _buildFeedGoodsListFSuper() {
//    String _materialID;
//    if (findProductMaterial.id.isNotEmpty) {
//      _materialID = findProductMaterial.id;
//    } else {
//      return Container();
//    }
//    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
//      return FeedGoodsAPI.fetch(
//          pageSize:
//              5); //MaterialGoodsAPI.fetch("$_materialID", pageNum: 0, pageSize: 10);
//    }, builder: (context, snapshot) {
//      var data = snapshot;
//      return ListView.separated(
//        separatorBuilder: (context, index) {
//          return buildSmallMargin();
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
//                  data[index].goodsIntroduce == "")
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
//
//  Widget _buildMaterialGoodsListSuper() {
//    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
//      String _materialID;
//      if (findProductMaterial.id.isNotEmpty) {
//        _materialID = findProductMaterial.id;
//      } else {
//        return Container();
//      }
//      return MaterialGoodsAPI.fetch("$_materialID", pageNum: 0, pageSize: 10);
//    }, builder: (context, snapshot) {
//      var data = snapshot;
//      return Container(
//          height: AppSize.height(360),
////          width:ScreenUtil().setWidth(360),
//          child: ListView.separated(
//            separatorBuilder: (context, index) {
//              return buildSmallMargin();
//            },
//            itemBuilder: (context, index) {
//              String _text = data[index].goodsTitleS.isEmpty
//                  ? data[index].goodsTitle
//                  : data[index].goodsTitleS;
//              String _subText = data[index].goodsSales.toString().isEmpty
//                  ? "${data[index].goodsIntroduce ?? ""}"
//                  : "已售${NumberUtils.amountConversion(data[index].goodsSales)}"; //{data[index].goodsSales.toString()}件
////              String _subText = (data[index].goodsIntroduce == null ||
////                  data[index].goodsIntroduce == "")
////                  ? ""
////                  : data[index].goodsIntroduce;
//              return GoodsListWidgetFSuperEx(
//                text: _text,
//                picUrl: data[index].goodsPic,
//                subText: _subText, //data[index].goodsIntroduce ?? "",
//                quanMoney: data[index].quanMoney,
//                quanEndPrice: data[index].quanEndPrice,
//                goodsPrice: data[index].goodsPrice,
////                goodsSales: data[index].goodsSales,
//                maxLines: 2,
//                onTap: () {
//                  NavigatorUtil.goodsDetails(context, data: data[index]);
//                },
//              );
//            },
//            shrinkWrap: true,
//            scrollDirection: Axis.horizontal,
//            itemCount: data.length,
//          ));
//    });
//  }
//
//  Widget _buildFilterGoodsListSuper() {
//    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
//      return FilterGoodsAPI.fetch(
//          rate: 20,
//          ratemax: 80,
//          price: 0,
//          pricemax: 10,
//          sales: 10000,
//          pageSize: 5);
//    }, builder: (context, snapshot) {
//      var data = snapshot;
//      return Container(
//          height: AppSize.height(360),
////          width:ScreenUtil().setWidth(360),
//          child: ListView.separated(
//            separatorBuilder: (context, index) {
//              return buildSmallMargin();
//            },
//            itemBuilder: (context, index) {
//              String _text = data[index].goodsTitleS.isEmpty
//                  ? data[index].goodsTitle
//                  : data[index].goodsTitleS;
//              String _subText = data[index].goodsSales.toString().isEmpty
//                  ? "${data[index].goodsIntroduce ?? ""}"
//                  : "已售${NumberUtils.amountConversion(data[index].goodsSales)}"; //{data[index].goodsSales.toString()}件
//
//              return GoodsListWidgetFSuperEx(
//                text: _text,
//                picUrl: data[index].goodsPic,
//                subText: _subText, //data[index].goodsIntroduce ?? "",
//                quanMoney: data[index].quanMoney,
//                quanEndPrice: data[index].quanEndPrice,
//                goodsPrice: data[index].goodsPrice,
////                goodsSales: data[index].goodsSales,
//                maxLines: 2,
//                onTap: () {
//                  NavigatorUtil.goodsDetails(context, data: data[index]);
//                },
//              );
//            },
//            shrinkWrap: true,
//            scrollDirection: Axis.horizontal,
//            itemCount: data.length,
//          ));
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return _isLoading
//        ? Container()
//        : Scaffold(
//            // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
//            appBar: AppBar(
////                backgroundColor: Color(0x666666),
//              centerTitle: true,
//              elevation: 0,
//              leading: Icon(Icons.home),
//              title: Text("${S.of(context).homeTitle}",style: TextStyle(fontSize: AppSize.sp(30.0)),),
//              actions: [
//                IconButton(
//                  icon: Icon(Icons.search),
//                  tooltip: "${S.of(context).searchTip}",
//                  onPressed: () {
//                    NavigatorUtil.goSearchPage(context, data: '女装');
//                  },
//                ),
//              ],
//            ),
////            PreferredSize(
////              child: AppBar(
//////                backgroundColor: Color(0x666666),
////                centerTitle: true,
////                elevation: 0,
////                leading: Icon(Icons.home),
////                title: Text("${S.of(context).homeTitle}"),
////                actions: [
////                  IconButton(
////                    icon: Icon(Icons.search),
////                    tooltip: "${S.of(context).searchTip}",
////                    onPressed: () {},
////                  ),
////                ],
////              ),
////              preferredSize: Size.fromHeight(AppSize.sp(66.0)), // Size.zero,
////            ),
//            backgroundColor: Colors.white,
//            body: Builder(builder: (context) {
//              return SingleChildScrollView(
//                physics: BouncingScrollPhysics(),
//                padding: EdgeInsets.only(
//                    left: 0.0, top: 2.0, right: 0.0, bottom: 0.0),
//                child: Column(
////                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    _buildBanner(),
//
//                    buildSmallMargin(),
//                    _buildHomeIconList(),
//
//                    buildTitle("好券直播"),
//                    _buildMaterialGoodsListSuper(),
//
//                    buildTitle("热卖榜单(9.9)"),
//                    _buildFilterGoodsListSuper(),
//
//                    buildTitle("最新更新"),
//                    buildSmallMargin(), //
//                    _buildFeedGoodsListFSuper(),
//                  ],
//                ),
//              );
//            }));
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    if (_isLoading) {
//      loadIndexJsonData();
//    }
//  }
//
//  @override
//  bool get wantKeepAlive => true;
//
//  void loadIndexJsonData() async {
//    APPIndexRoot entity = await HomeIndexJsonDio.fetch();
//    if (entity != null) {
//      if (mounted) {
//        setState(() {
//          bannerList = entity.bannerList;
//          iconList = entity.iconList;
//          findProductMaterial = entity.findProductMaterial;
//          guessProductList = entity.guessProductList;
//
//          _isLoading = false;
//
//          loadData(findProductMaterial.id);
//        });
//      }
//    }
//  }
//}
