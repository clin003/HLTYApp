//import 'package:app/apifetch/feed_goods_api.dart';
//import 'package:common_utils/common_utils.dart' as commonUtils;
//import 'package:flutter/material.dart';
//import 'package:app/application.dart';
//import 'package:app/utils/utils.dart';
//import 'package:app/utils/log_util.dart';
//import 'package:app/widgets/common_text_style.dart';
//
//import 'package:app/models/goods.dart';
//import 'package:app/utils/navigator_util.dart';
//import 'package:app/widgets/h_empty_view.dart';
//import 'package:app/widgets/v_empty_view.dart';
//import 'package:app/widgets/widget_banner.dart';
//import 'package:app/widgets/widget_future_builder.dart';
//import 'package:app/widgets/widget_goods_list.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
////import 'package:provider/provider.dart';
//import 'package:app/models/index_home.dart';
//import 'package:app/apifetch/home_index_json.dart';
//import 'package:app/apifetch/material_goods_api.dart';
//import 'package:app/apifetch/filter_goods_api.dart';
//import 'package:app/utils/app_size.dart';
//import 'package:app/generated/l10n.dart';
//
//import 'package:app/utils/number_utils.dart';
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
//    var width = ScreenUtil().setWidth(100);
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
//                VEmptyView(10),
//                Text(
//                  '${iconList[index].name}',
//                  style: TextStyle(color: Colors.black87, fontSize: 14),
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
//    List<GoodsItem> entity = await MaterialGoodsAPI.fetch(id);
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
//  Widget _buildGoodsList() {
//    var data = goodsList;
//    return ListView.separated(
//      separatorBuilder: (context, index) {
//        return VEmptyView(ScreenUtil().setWidth(100));
//      },
//      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//      itemBuilder: (context, index) {
//        return Column(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            ClipRRect(
//              borderRadius: BorderRadius.all(Radius.circular(8)),
//              child: Utils.showNetImage(
//                '${data[index].goodsPic}',
//              ),
//            ),
//            VEmptyView(5),
//            Text(
//              data[index].goodsTitle,
//              style: commonTextStyle,
//              maxLines: 1,
//              overflow: TextOverflow.ellipsis,
//            ),
//            VEmptyView(2),
//            Text(
//              data[index].goodsIntroduce,
//              style: smallGrayTextStyle,
//            ),
//          ],
//        );
//      },
//      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
//      itemCount: data.length,
//    );
//  }
//
//
//  /// 构建10-99
//  Widget _buildMaterialGoodsList() {
//    String _materialID;
//    if (findProductMaterial.id.isNotEmpty) {
//      _materialID = findProductMaterial.id;
//    } else {
//      return Container();
//    }
//    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
//      return MaterialGoodsAPI.fetch("$_materialID", pageNum: 0, pageSize: 10);
//    }, builder: (context, snapshot) {
//      var data = snapshot;
//      return Container(
//          height: ScreenUtil().setWidth(300),
//          child: ListView.separated(
//            separatorBuilder: (context, index) {
//              return HEmptyView(ScreenUtil().setWidth(30));
//            },
//            padding:
//                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//            itemBuilder: (context, index) {
//              return GoodsListWidget(
//                text: data[index].goodsTitle,
//                picUrl: data[index].goodsPic,
//                subText: data[index].goodsIntroduce ?? "",
//                maxLines: 1,
//                onTap: () {
////                  NavigatorUtil.goPlayListPage(context, data: data[index]);
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
//  Widget _buildFeedGoodsList() {
//    return CustomFutureBuilder<List<GoodsItem>>(futureFunc: (context) {
//      return FeedGoodsAPI.fetch(pageSize: 5);
//    }, builder: (context, snapshot) {
//      var data = snapshot;
//      return Container(
//          height: ScreenUtil().setWidth(380),
//          child: ListView.separated(
//            separatorBuilder: (context, index) {
//              return HEmptyView(ScreenUtil().setWidth(30));
//            },
//            padding:
//                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//            itemBuilder: (context, index) {
//              String _text = data[index].goodsTitleS.isEmpty
//                  ? data[index].goodsTitle
//                  : data[index].goodsTitleS;
//              String _subText = data[index].goodsSales.toString().isEmpty
//                  ? "${data[index].goodsIntroduce ?? ""}"
//                  : "已售${NumberUtils.amountConversion(data[index].goodsSales)}"; //{data[index].goodsSales.toString()}件
//              return GoodsListWidget(
//                text: _text,
//                picUrl: data[index].goodsPic,
//                subText: _subText, //data[index].goodsIntroduce ?? "",
//                quanMoney: data[index].quanMoney,
//                quanEndPrice: data[index].quanEndPrice,
//                goodsPrice: data[index].goodsPrice,
////                goodsSales: data[index].goodsSales,
//                maxLines: 2,
//                onTap: () {
////                  NavigatorUtil.goPlayListPage(context, data: data[index]);
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
//  Widget _buildFilterGoodsList() {
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
//          height: ScreenUtil().setWidth(300),
//          child: ListView.separated(
//            separatorBuilder: (context, index) {
//              return HEmptyView(ScreenUtil().setWidth(30));
//            },
//            padding:
//                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//            itemBuilder: (context, index) {
//              return GoodsListWidget(
//                text: data[index].goodsTitle,
//                picUrl: data[index].goodsPic,
//                subText: data[index].goodsIntroduce ?? "",
//                maxLines: 1,
//                onTap: () {
////                  NavigatorUtil.goPlayListPage(context, data: data[index]);
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
////    if (_isLoading){
////      return Text("加载中");
////    }
//    super.build(context);
//    return _isLoading
//        ? Text("")
//        : Scaffold(
//            // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
//            appBar: PreferredSize(
//              child: AppBar(
//                elevation: 0,
//                leading: Icon(Icons.home),
//                title: Text("${S.of(context).homeTitle}"),
//                actions: [
//                  IconButton(
//                    icon: Icon(Icons.search),
//                    tooltip: "${S.of(context).searchTip}",
//                    onPressed: () {},
//                  ),
//                ],
//              ),
//              preferredSize: Size.fromHeight(AppSize.sp(66.0)), // Size.zero,
//            ),
//            backgroundColor: Colors.white,
//            body: SingleChildScrollView(
//              padding:
//                  EdgeInsets.only(left: 0.0, top: 2.0, right: 0.0, bottom: 0.0),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  _buildBanner(),
//                  Padding(
//                    padding: EdgeInsets.symmetric(
//                      horizontal: ScreenUtil().setWidth(15),
//                    ),
//                    child: Column(
//                      mainAxisSize: MainAxisSize.min,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        VEmptyView(40),
//                        _buildHomeIconList(),
//                        VEmptyView(20),
//                        Text(
//                          '最新更新',
//                          style: commonTextStyle,
//                        ),
//                      ],
//                    ),
//                  ),
//                  VEmptyView(20),
//                  _buildFeedGoodsList(),
//                  VEmptyView(30),
//                  Padding(
//                    padding: EdgeInsets.symmetric(
//                      horizontal: ScreenUtil().setWidth(15),
//                    ),
//                    child: Text(
//                      '热卖榜单(9.9)',
//                      style: commonTextStyle,
//                    ),
//                  ),
//                  VEmptyView(20),
//                  _buildFilterGoodsList(),
//
//                  VEmptyView(30),
//                  Padding(
//                    padding: EdgeInsets.symmetric(
//                      horizontal: ScreenUtil().setWidth(15),
//                    ),
//                    child: Text(
//                      '好券直播',
//                      style: commonTextStyle,
//                    ),
//                  ),
//                  VEmptyView(20),
//                  _buildGoodsList(),
////                  _buildMaterialGoodsList(),
//                ],
//              ),
//            ),
//          );
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
