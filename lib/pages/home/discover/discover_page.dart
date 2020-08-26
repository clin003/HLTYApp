//import 'package:common_utils/common_utils.dart' as commonUtils;
//import 'package:flutter/material.dart';
//import 'package:app/application.dart';
//import 'package:app/utils/utils.dart';
//import 'package:app/utils/log_util.dart';
//import 'package:app/widgets/common_text_style.dart';
//import 'package:app/models/tbk_activity.dart' as prefix0;
//import 'package:app/models/goods.dart';
//import 'package:app/utils/navigator_util.dart';
//import 'package:app/utils/net_utils.dart';
//import 'package:app/widgets/h_empty_view.dart';
//import 'package:app/widgets/v_empty_view.dart';
//import 'package:app/widgets/widget_banner.dart';
//import 'package:app/widgets/widget_future_builder.dart';
//import 'package:app/widgets/widget_goods_list.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:provider/provider.dart';
//
//class DiscoverPage extends StatefulWidget {
//  @override
//  _HomePrePageState createState() => _HomePrePageState();
//}
//
//class _HomePrePageState extends State<DiscoverPage>
//    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
//  /// 构建轮播图
//  Widget _buildBanner() {
//    return CustomFutureBuilder<prefix0.TbkActivity>(
//      futureFunc: NetUtils.getBannerData,
//      builder: (context, data) {
//        LogUtil.e("<DiscoverPage>构建轮播图(共计):${data.data.length}");
//        return CustomBanner(
//          data.data.map((e) => '${e.bannerUrl}').toList(), //?param=540y210
//          onTap: (index) {
//            LogUtil.e("<DiscoverPage>构建轮播图:$index");
//            LogUtil.e("<DiscoverPage>构建轮播图:${data.data[index].bannerUrl}");
//            LogUtil.e("<DiscoverPage>构建轮播图:${data.data[index].pageName}");
//            LogUtil.e("<DiscoverPage>构建轮播图:${data.data[index].activityId}");
//            LogUtil.e(
//                "<DiscoverPage>构建轮播图:${data.data[index].avgCommissionRate}");
//          },
//        );
//      },
//    );
//  }
//
//  /// 构建分类列表
//  Widget _buildHomeCategoryList() {
//    var map = {
//      '每日推荐': 'assets/images/icon/icon_daily.png',
//      '歌单': 'assets/images/icon_playlist.png',
//      '排行榜': 'assets/images/icon_rank.png',
//      '电台': 'assets/images/icon_radio.png',
//      '直播': 'assets/images/icon_look.png',
//    };
//
//    var keys = map.keys.toList();
//    var width = ScreenUtil().setWidth(100);
//
//    return GridView.custom(
//      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
//      padding: EdgeInsets.only(bottom: 10),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: keys.length,
//        childAspectRatio: 1 / 1.1,
//      ),
//      childrenDelegate: SliverChildBuilderDelegate(
//        (context, index) {
//          return GestureDetector(
//            behavior: HitTestBehavior.translucent,
//            onTap: () {
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
//                          border: Border.all(color: Colors.black12, width: 0.5),
//                          gradient: RadialGradient(
//                            colors: [
//                              Color(0xFFFF8174),
//                              Colors.red,
//                            ],
//                            center: Alignment(-1.7, 0),
//                            radius: 1,
//                          ),
//                          color: Colors.red),
//                    ),
//                    Image.asset(
//                      map[keys[index]],
//                      width: width,
//                      height: width,
//                    ),
//                    Container(
//                      padding: EdgeInsets.only(top: 5),
//                      child: keys[index] == '每日推荐'
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
//                  '${keys[index]}',
//                  style: TextStyle(color: Colors.black87, fontSize: 14),
//                ),
//              ],
//            ),
//          );
//        },
//        childCount: keys.length,
//      ),
//    );
//  }
//
//  /// 构建最新更新商品
//  Widget _buildNewGoodsList() {
//    return CustomFutureBuilder<GoodsList>(
//      futureFunc: NetUtils.getGoodsNewFeedList,
//      builder: (context, snapshot) {
//        var data = snapshot.data;
//        return Container(
//            height: ScreenUtil().setWidth(300),
//            child: ListView.separated(
//              separatorBuilder: (context, index) {
//                return HEmptyView(ScreenUtil().setWidth(30));
//              },
//              padding:
//                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//              itemBuilder: (context, index) {
//                return GoodsListWidget(
//                  text: data[index].goodsTitle,
//                  picUrl: data[index].goodsPic,
////                  playCount: data[index].goodsSales,
//                  maxLines: 2,
//                  onTap: () {
////                    NavigatorUtil.goPlayListPage(context, data: data[index]);
//                  },
//                );
//              },
//              shrinkWrap: true,
//              scrollDirection: Axis.horizontal,
//              itemCount: data.length,
//            ));
//      },
//    );
//  }
//
//  /// 构建10-99
//  Widget _build10To100Filter() {
//    return CustomFutureBuilder<GoodsList>(
//        futureFunc: NetUtils.getGoodsFilter99List,
//        builder: (context, snapshot) {
//          var data = snapshot.data;
//          return Container(
//              height: ScreenUtil().setWidth(300),
//              child: ListView.separated(
//                separatorBuilder: (context, index) {
//                  return HEmptyView(ScreenUtil().setWidth(30));
//                },
//                padding:
//                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//                itemBuilder: (context, index) {
//                  return GoodsListWidget(
//                    text: data[index].goodsTitle,
//                    picUrl: data[index].goodsPic,
//                    subText: data[index].goodsIntroduce ?? "",
//                    maxLines: 1,
//                    onTap: () {
////                      NavigatorUtil.goPlayListPage(context, data: data[index]);
//                    },
//                  );
//                },
//                shrinkWrap: true,
//                scrollDirection: Axis.horizontal,
//                itemCount: data.length,
//              ));
//        });
//  }
//
//  /// 0-10 排行榜
//  Widget _build0To10Filter() {
//    return CustomFutureBuilder<GoodsList>(
//        futureFunc: NetUtils.getGoodsFilter9List,
//        builder: (context, snapshot) {
//          var data = snapshot.data;
//          return ListView.separated(
//            separatorBuilder: (context, index) {
//              return VEmptyView(ScreenUtil().setWidth(100));
//            },
//            padding:
//                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
//            itemBuilder: (context, index) {
//              return Column(
//                mainAxisSize: MainAxisSize.min,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  ClipRRect(
//                    borderRadius: BorderRadius.all(Radius.circular(8)),
//                    child: Utils.showNetImage(
//                      '${data[index].goodsPic}',
//                    ),
//                  ),
//                  VEmptyView(5),
//                  Text(
//                    data[index].goodsTitle,
//                    style: commonTextStyle,
//                    maxLines: 1,
//                    overflow: TextOverflow.ellipsis,
//                  ),
//                  VEmptyView(2),
//                  Text(
//                    data[index].goodsIntroduce,
//                    style: smallGrayTextStyle,
//                  ),
//                ],
//              );
//            },
//            shrinkWrap: true,
//            physics: NeverScrollableScrollPhysics(),
//            itemCount: data.length,
//          );
//        });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: SingleChildScrollView(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            _buildBanner(),
//            Padding(
//              padding: EdgeInsets.symmetric(
//                horizontal: ScreenUtil().setWidth(15),
//              ),
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  VEmptyView(40),
//                  _buildHomeCategoryList(),
//                  VEmptyView(20),
//                  Text(
//                    '最新更新',
//                    style: commonTextStyle,
//                  ),
//                ],
//              ),
//            ),
//            VEmptyView(20),
//            _buildNewGoodsList(),
//            VEmptyView(30),
//            Padding(
//              padding: EdgeInsets.symmetric(
//                horizontal: ScreenUtil().setWidth(15),
//              ),
//              child: Text(
//                '热卖榜单',
//                style: commonTextStyle,
//              ),
//            ),
//            VEmptyView(20),
//            _build10To100Filter(),
//            VEmptyView(30),
//            Padding(
//              padding: EdgeInsets.symmetric(
//                horizontal: ScreenUtil().setWidth(15),
//              ),
//              child: Text(
//                '9.9榜单',
//                style: commonTextStyle,
//              ),
//            ),
//            VEmptyView(20),
//            _build0To10Filter(),
//          ],
//        ),
//      ),
//    );
//  }
//
//  @override
//  bool get wantKeepAlive => true;
//}
