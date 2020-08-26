import 'package:app/apifetch/huiguangbo_msg_push_to_ws_api.dart';
import 'package:app/apifetch/taobao.tbk.privilege.get_api.dart';
import 'package:app/apifetch/taobao.tbk.tpwd.create_api.dart';
import 'package:app/application.dart';
import 'package:app/models/feed_rich_msg_model.dart';
import 'package:app/models/openapi_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app/models/tbk_dg_material_optional_entity.dart';
import 'package:app/models/goods.dart';
import 'package:app/models/haodanku_item_detail.dart';

import 'package:app/apifetch/tbk_dg_material_optional_api.dart';
import 'package:app/apifetch/haodanku_item_detail_api.dart';

import 'package:app/pages/goods/goods_details_top_gallery_swiper.dart';
import 'package:app/pages/goods/goods_details_body_images.dart';
import 'package:app/pages/goods_list/goods_list_similar.dart';

import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/navigator_util.dart';

import 'package:app/widgets/widget_lite.dart';
//import 'package:flutter/services.dart';

import 'package:fsuper/fsuper.dart';
import 'package:app/utils/url_lanch_utils.dart';
import 'package:share/share.dart';

///
/// 商品详情页
///
class GoodsDetails extends StatefulWidget {
  final String id;
  final GoodsItem goodsItem;

  GoodsDetails(this.id, {this.goodsItem});

  @override
  _GoodsDetailsState createState() => _GoodsDetailsState();
}

class _GoodsDetailsState extends State<GoodsDetails> {
  Map_data _map_data = Map_data();
  bool isLike;
  bool _banChickUrl = true;

  String _title = "";
  String _goodsIntroduce = "";
  String _quanMoney = "";
  String _quanId = "";
  String _goodsTitle = "";
  String _goodsPic = '';
  List<String> urls = List();
  List<String> urlsBodyImage = List();
  String _shopTypeName = "";

  ///跨店满减信息
  String _kuadianPromotionInfo = "";

  ///营销-天猫营销玩法
  String _tmallPlayActivityInfo = "";

  ///活动价
  String _sale_price = "";

  ///商品标价 or 折扣价（元） 若属于预售商品，付定金时间内，折扣价=预售价
  String _goodsPrice = "";

  ///商品券后价
  String _goodsPriceFinal = "";
  String _tbkCommission = "";
  String _tbkClickUrl = '';
  String _taokouling = '';

  Color _textColor = Colors.deepOrange;
//商家店铺名称
  String _shopName = "";
//  商家昵称
  String _shopNick = "";
  //商家地区
  String _shopProvcity = "";

  @override
  void initState() {
    _banChickUrl = Application.sp.getBool("banChickUrl");
    isLike = false;
    if (mounted) {
      copyData();
//      loadData();
//      lodaDataDetail();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void copyData() async {
    LogUtil.v("copyData:$_goodsIntroduce");
    if (mounted) {
      if (widget.goodsItem != null) {
        setState(() {
          _title = widget.goodsItem.goodsTitleS != ""
              ? widget.goodsItem.goodsTitleS
              : widget.goodsItem.goodsTitle;

          if ((widget.goodsItem.goodsIntroduce ?? "").isNotEmpty) {
            _goodsIntroduce = widget.goodsItem.goodsIntroduce;
          }
          if (widget.goodsItem.shopType == "tianmao") {
            _shopTypeName = "天猫";
            _textColor = Colors.red;
          } else {
            _shopTypeName = "淘宝";
          }
          _quanMoney = widget.goodsItem.quanMoney.toString();
          _quanId = widget.goodsItem.quanId;
          _goodsTitle = widget.goodsItem.goodsTitle;
          _goodsPic = widget.goodsItem.goodsPic;
          _goodsPriceFinal = widget.goodsItem.quanEndPrice.toString();
          _goodsPrice = widget.goodsItem.goodsPrice.toString();
          _tbkCommission = (widget.goodsItem.tbkCommission * 100).toString();
        });
      }
    }
    LogUtil.v("copyData(End):$_goodsIntroduce");
    loadData();
//
  }

  void loadData() async {
    TbkDgMaterialOptionalModelRoot entity = await TbkDgMaterialOptionalAPI.fetch(
        query:
            "https://detail.m.tmall.com/item.htm?id=${widget.id.toString()}");
    if (mounted) {
      if (entity?.tbk_dg_material_optional_response.result_list.map_data !=
          null) {
        if (entity
                .tbk_dg_material_optional_response.result_list.map_data.length >
            0) {
          _map_data =
              entity.tbk_dg_material_optional_response.result_list.map_data[0];

          urls.clear();
          setState(() {
            urls = _map_data.small_images.string;
            if (urls.length < 1) {
              urls.add(widget.goodsItem.goodsPic ?? "");
            }

            if (_title == "") {
              _title = _map_data.title;
            }

            LogUtil.v("loadData:$_goodsIntroduce");
            if ((_map_data.item_description ?? "").isNotEmpty &&
                _goodsIntroduce.isEmpty) {
              _goodsIntroduce = _map_data.item_description ?? "";
            }
            if (_map_data.user_type > 0) {
              _shopTypeName = "天猫";
              _textColor = Colors.red;
            } else {
              _shopTypeName = "淘宝";
            }

            if (double.parse(_map_data.coupon_amount ?? '0.0') >
                widget.goodsItem.quanMoney) {
              _quanMoney = _map_data.coupon_amount;
              _quanId = _map_data.coupon_id;
            }

            if ((_map_data.title ?? "") != "" && _goodsTitle.isEmpty) {
              _goodsTitle = _map_data.title ?? "";
            }
            if ((_map_data.pict_url ?? "") != "" && _goodsPic.isEmpty) {
              _goodsPic = _map_data.pict_url ?? "";
            }
//            _goodsPic=widget.goodsItem.goodsPic;

            if ((_map_data.kuadian_promotion_info ?? "") != "") {
              _kuadianPromotionInfo = _map_data.kuadian_promotion_info ?? "";
            }

            if ((_map_data.sale_price ?? "") != "") {
              _sale_price = _map_data.sale_price ?? "";
            }
            if ((_map_data.zk_final_price ?? "") != "") {
              _goodsPrice = _map_data.zk_final_price ?? "";
            }
            if ((_map_data.commission_rate ?? "") != "") {
              //商品信息-佣金比率。1550表示15.5%
              _tbkCommission = _map_data.commission_rate ?? "";
            }

            if ((_map_data.tmall_play_activity_info ?? "") != "") {
              _tmallPlayActivityInfo = _map_data.tmall_play_activity_info ?? "";
            }

            if ((_map_data.shop_title ?? "") != "") {
              _shopName = _map_data.shop_title ?? "";
              _shopNick == _map_data.nick ?? "";
              _shopProvcity = _map_data.provcity ?? "";
            }
          });
        }
      }
    }
    LogUtil.v("loadData(End):$_goodsIntroduce");
//    lodaDataDetail();
    loadTbkChickURL();
  }

  void lodaDataDetail() async {
    String _taobaoImage = "";
    HaodankuItemDetailRoot entity =
        await HaodankuItemDetailAPI.fetch(widget.id);
    if (mounted) {
      if (entity?.data != null) {
        if (entity.data?.taobao_image != null) {
          _taobaoImage = entity.data.taobao_image;
        }

        if (_taobaoImage.contains(",")) {
          urlsBodyImage.clear();
          setState(() {
            urlsBodyImage = _taobaoImage.split(",");

            LogUtil.v("lodaDataDetail:$_goodsIntroduce");
            if (_goodsIntroduce.isEmpty &&
                (entity.data.guide_article ?? "").isNotEmpty) {
              _goodsIntroduce = entity.data.guide_article;
            }
            if (_goodsPriceFinal == "") {
              _goodsPriceFinal = entity.data.itemendprice;
              _quanId = entity.data.activityid ?? "";
              _quanMoney = entity.data.couponmoney ?? "";
            }
//            if (entity.data.tkrates != null && _tbkCommission=="") {
//              _tbkCommission = entity.data.tkrates;
//            }

            if (_goodsPrice == "") {
              _goodsPrice = entity.data.itemprice;
            }
          });
        }
      }
    }
    LogUtil.v("lodaDataDetail(End):$_goodsIntroduce");
  }

  void loadTbkChickURL() async {
    OpenAPIResponseModel entity1 = await TbkPrivilegeGetRequestlAPI.fetch(
      quanid: '$_quanId',
      item_id: widget.id,
    );
    if (entity1?.code != null && entity1.code == 0) {
      _tbkClickUrl = entity1.data;
      OpenAPIResponseModel entity2 =
          await TbkTpwdCreateRequestAPI.fetch(_tbkClickUrl);
      if (entity2?.code != null && entity2.code == 0) {
        _taokouling = entity2.data;
      }
    } else {
      buildshowDialog(context, '$entity1');
    }
    LogUtil.v("loadTbkChickURL(_tbkClickUrl):$_tbkClickUrl,(entity1)$entity1");
    LogUtil.v("loadTbkChickURL(item_id):${widget.id},(_quanId)$_quanId");
  }

  ///发送到慧广播
  Future<void> _buildHuiguangboMsgAndPush() {
    bool _isHasQuan = false;
    if (double.parse(_quanMoney) > 0) {
//      _priceLable = '福利价：';
      _isHasQuan = true;
    }

    FeedRichMsgModel _huiguangboMsg = FeedRichMsgModel(
      msgtype: 'rich',
      msgID: '${widget.id}',
      image: FeedRichMsgModelImage(picURL: '$_goodsPic', filePath: ''),
      text: FeedRichMsgModelText(
        content: '${(_title == '') ? _goodsTitle : _title}\n'
            '${(_isHasQuan) ? _goodsPriceFinal : _goodsPrice}元\n'
//            '$_goodsIntroduce\n'
            '复制 $_taokouling'
            '$_tbkClickUrl\n',
      ),
    );
    HuiguangboMsgPushToWsDio.fetch(_huiguangboMsg).then((value) {
      if (value) {
        buildshowDialog(context, '分享到慧广播：成功');
      } else {
        buildshowDialog(context, '分享到慧广播：失败(请检查，工具——openAPI配置信息是否正确)！');
      }
    }).catchError((e) {
      buildshowDialog(context, '$e');
    });
  }

  ///分享宝贝信息
  Future<void> _goToShare() {
    bool _isHasQuan = false;
    if (double.parse(_quanMoney) > 0) {
//      _priceLable = '福利价：';
      _isHasQuan = true;
    }
    final RenderBox box = context.findRenderObject();
    Share.share(
        '${(_title == '') ? _goodsTitle : _title}\n'
        '${(_isHasQuan) ? _goodsPriceFinal : _goodsPrice}元\n'
//            '$_goodsIntroduce\n'
        '复制 $_taokouling'
            '$_tbkClickUrl\n',
        subject: '${(_title == '') ? _goodsTitle : _title}',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  ///跳转到淘礼金生成页面
  Future<void> _goToTaolijinCreatePage() {
    NavigatorUtil.goToolsTaolijinCreatePage(context,
        id: '${widget.id}',
        title: '$_title',
        quanEndPrice: _goodsPriceFinal,
        tbkCommission: _tbkCommission,
        quanId: _quanId);
  }

  ///制作商品标题
//  Widget _buildGoodsTitle() {
//    return FSuper(
//      text: '$_goodsTitle【$_shopName】',
////      padding: EdgeInsets.all(5),
//      margin: EdgeInsets.all(10),
//      textAlignment: Alignment.topLeft,
//      textAlign: TextAlign.left,
//    );
//  }

  Widget _buildGoodsTitleEx() {
    return FSuper(
      width: double.infinity,
      padding: (_shopTypeName == "")
          ? EdgeInsets.all(0.1)
          : EdgeInsets.only(left: (12.0 + 10.0 + 20)), //AppSize.width(100)
      margin: EdgeInsets.all(10),
      strokeWidth: 1,
      text: '$_goodsTitle',
      textAlign: TextAlign.left,
      textAlignment: Alignment.topLeft,
      textSize: AppSize.sp(28.0),
      spans: [
        TextSpan(
          text: (_shopName.isEmpty) ? '' : '【$_shopName】',
          style: TextStyle(
            fontSize: AppSize.sp(22.0),
          ),
        ),
      ],
      child1: (_shopTypeName == "")
          ? Container()
          : Transform.rotate(
              angle: 0,
              child: FSuper(
                text: '$_shopTypeName',
                textColor: _textColor,
                textSize: AppSize.sp(27.0),
                padding: EdgeInsets.all(2),
                corner: Corner.all(3),
                strokeColor: _textColor,
                strokeWidth: 1,
              ),
            ),
      child1Alignment: Alignment.centerLeft,
    );
  }

  ///制作商品标签
  Widget _buildGoodsTags() {
    var _money = 0.0;
    if (double.parse(_quanMoney) > 0) {
      _money = double.parse(_quanMoney);
    } else {
      return Container();
    }
    return FSuper(
      text: "🏷️ 福利",
      textSize: AppSize.sp(22),
      textAlign: TextAlign.left,
      textAlignment: Alignment.topLeft,
//      margin: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 8, top: 5, bottom: 5),
      spans: [
        TextSpan(
          text: (_money > 0) ? "$_quanMoney元" : "",
          style: TextStyle(
            color: _textColor,
          ),
        ),
        TextSpan(
          text: (_money > 0) ? "(包含$_quanMoney元优惠券)" : "",
        ),
        TextSpan(
          text: (_kuadianPromotionInfo != "") ? ",$_kuadianPromotionInfo" : "",
        ),
        TextSpan(
          text:
              (_tmallPlayActivityInfo != "") ? ",$_tmallPlayActivityInfo" : "",
        ),
      ],
    );
  }

  ///制作商品价格标签
  Widget _buildGoodsTagsPrice() {
    String _priceLable = '一口价：';
    bool _isHasQuan = false;
    if (double.parse(_quanMoney) > 0) {
      _priceLable = '福利价：';
      _isHasQuan = true;
    }
    return FSuper(
      width: double.infinity,
//      padding: EdgeInsets.only(left: (12.0 + 10.0 + 20)), //AppSize.width(100)
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      strokeWidth: 1,
      text: _priceLable,
//        textColor: Colors.grey,
      textColor: _textColor,
      textAlign: TextAlign.left,
      textAlignment: Alignment.topLeft,
      textSize: AppSize.sp(25.0),
      spans: [
        TextSpan(text: " "),
        TextSpan(
          text: (!_isHasQuan) ? '¥$_goodsPrice' : '¥$_goodsPriceFinal',
          style: TextStyle(fontSize: AppSize.sp(30.0)),
        ),
        TextSpan(text: " "),
        TextSpan(
          text: (_goodsPrice == _goodsPriceFinal || !_isHasQuan)
              ? ""
              : "¥$_goodsPrice",
          style: TextStyle(
            fontSize: AppSize.sp(22.0),
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }

  ///制作商品推荐语标签
  Widget _buildGoodsIntroduce() {
    LogUtil.v('_buildGoodsIntroduce:$_goodsIntroduce');
    return (_goodsIntroduce.isEmpty)
        ? Container()
        : FSuper(
            text: '$_goodsIntroduce',
            textColor: Colors.grey,
            textSize: AppSize.sp(23.0),
            textAlignment: Alignment.topLeft,
            textAlign: TextAlign.left,
            width: double.infinity,
//      padding: EdgeInsets.only(left: (12.0 + 10.0 + 20)), //AppSize.width(100)
            margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
          );
  }

  Widget _buildBottomNavigationBar() {
//    Color _color = Colors.red;
//    Color _bgColor=Colors.redAccent;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: FSuper(
            padding: EdgeInsets.all(5),
            text: "立即分享",
            textColor: _textColor,
            backgroundColor: Colors.white.withOpacity(0.8),
            corner: Corner(leftBottomCorner: 10, leftTopCorner: 10),
            strokeColor: _textColor,
            strokeWidth: 1,
          ),
          onTap: () {
            _goToShare();
          },
        ),
      GestureDetector(
          child: FSuper(
            padding: EdgeInsets.all(5),
            text: (_banChickUrl) ? '生成淘礼金' : "立即领券",
//            textColor: _textColor.withOpacity(0.8),
            textColor: Colors.white,
            backgroundColor: _textColor.withOpacity(0.8),
            corner: Corner(rightBottomCorner: 10, rightTopCorner: 10),
            strokeColor: _textColor,
            strokeWidth: 1,
          ),
          onTap: () {
            if (_banChickUrl) {
              if (_title.isEmpty ||
                  _goodsPriceFinal.isEmpty ||
                  _tbkCommission.isEmpty) {
                //buildshowDialog(context, "");
              } else {
                NavigatorUtil.goToolsTaolijinCreatePage(context,
                    id: '${widget.id}',
                    title: '$_title',
                    quanEndPrice: _goodsPriceFinal,
                    tbkCommission: _tbkCommission,
                    quanId: _quanId);
              }
            } else {
              UrlLaunchUtils.launchURLWithScheme(_tbkClickUrl,
                  scheme: 'taobao:', text: _taokouling, errDialog: (e) {
                buildshowDialog(
                    context,
                    "以下内容已复制，请打开手淘App领取\n"
                    "$e");
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildPopupMenuButton() {
    return PopupMenuButton(
      child: Icon(Icons.more_vert),
//      tooltip: "tip",
//      initialValue: "sendHuiguangbo",
//      padding: EdgeInsets.all(200),
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            child: Text("发送慧广播"),
            value: "sendHuiguangbo",
          ),
          PopupMenuItem<String>(
            child: Text("生成淘礼金"),
            value: 'createTaolijin',
          )
        ];
      },
      onSelected: (String action) {
        switch (action) {
          case "sendHuiguangbo":
            _buildHuiguangboMsgAndPush();
            break;
          case "createTaolijin":
            _goToTaolijinCreatePage();
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
        appBar: AppBar(
//          backgroundColor: Color(0xffffc900),
          title: Text(
            _title,
            style: TextStyle(fontSize: AppSize.sp(33.0)),
          ),
          centerTitle: true,
          actions: <Widget>[
            _buildPopupMenuButton(),
//            IconButton(
//                icon: Icon(Icons.send),
//                onPressed: () {
//                  _buildHuiguangboMsgAndPush();
//                }),
//            IconButton(
//              icon: Icon(Icons.gif),
//              onPressed: _goToTaolijinCreatePage,
//            ),
          ],
        ),
//        bottomNavigationBar: _buildBottomNavigationBar(),
        floatingActionButton: _buildBottomNavigationBar(),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  DetailsTopGallery(gallery: urls),
//                  _buildGoodsTitle(),
                  _buildGoodsTitleEx(),
                  _buildGoodsTagsPrice(),
                  _buildGoodsTags(),
                  _buildGoodsIntroduce(),
                  buildSmallMargin(),

                  ///制作商品详情
                  GoodsDetailsBodyImages(
                    widget.id,
                    goodsBodyImagesList: urlsBodyImage,
                  ),
                  buildSmallMargin(),

                  ///制作相似商品列表
                  SimilarGoodsList(widget.id),
                  buildMiddleMargin(),
                ],
              ),
            );
          },
        ));
  }
}
