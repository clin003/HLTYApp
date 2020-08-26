import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app/models/haodanku_item_detail.dart';

import 'package:app/apifetch/haodanku_item_detail_api.dart';

import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';

import 'package:app/widgets/widget_lite.dart';

import 'package:fsuper/fsuper.dart';

///
/// 商品详情页
///
class GoodsDetailsBodyImages extends StatefulWidget {
  final String id;
  final List<String> goodsBodyImagesList;

  GoodsDetailsBodyImages(this.id, {this.goodsBodyImagesList});

  @override
  _GoodsDetailsBodyImagesState createState() => _GoodsDetailsBodyImagesState();
}

class _GoodsDetailsBodyImagesState extends State<GoodsDetailsBodyImages> {
  @override
  void initState() {
    if (mounted) {
      if (widget.goodsBodyImagesList.length > 0) {
        urlsBodyImage.clear();
        setState(() {
          urlsBodyImage = widget.goodsBodyImagesList;
        });
      } else {
        lodaDataDetail();
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          });
        }
      }
    }
  }

  List<String> urlsBodyImage = List();

  ///制作商品详情
  Widget _buildGoodsDetailImagesList() {
    LogUtil.v("_buildGoodsDetailImagesList(goodsID):${widget.id}");
    LogUtil.v("_buildGoodsDetailImagesList(length):${urlsBodyImage.length}");
    return Column(
      children: new List<Widget>.generate(urlsBodyImage.length, (int i) {
        return _buildGoodsDescContentPicList('${urlsBodyImage[i]}');
      }),
    );
  }

  Widget _buildGoodsDescContentPicList(String imgPicUrl) {
    LogUtil.v("_buildGoodsDescContentPicList:$imgPicUrl");
    return Image.network(
      ('$imgPicUrl'.contains('http:') || '$imgPicUrl'.contains('https:'))
          ? '$imgPicUrl'
          : 'https:' + '$imgPicUrl',
      fit: BoxFit.fill,
    );
  }

  Widget _buildSimilarTitle() {
    return FSuper(
      text: (urlsBodyImage.length > 0) ? "宝贝详情" : "",
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
          _buildGoodsDetailImagesList(),
        ],
      ),
    );
  }
}
