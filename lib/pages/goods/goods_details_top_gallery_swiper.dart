import 'package:flutter/material.dart';
import 'package:app/res/colours.dart';
import 'package:app/utils/app_size.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:app/utils/log_util.dart';

/// 商品详情头部
class DetailsTopGallery extends StatelessWidget {
  List<String> gallery = List();

  DetailsTopGallery({Key key, this.gallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.divider,
      child: Column(
        children: <Widget>[
          _goodsImage(),
        ],
      ),
    );
  }

  ///商品图片
  Widget _goodsImage() {
    LogUtil.v("_goodsImage(length):${gallery.length}");
    return (gallery.length<1)?Container():Container(
      height: AppSize.height(640),
      width: double.infinity,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "${gallery[index]}",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: gallery.length,
        pagination: SwiperPagination(margin: EdgeInsets.all(1.0)),
        autoplay: true,
      ),
    );
  }
}
