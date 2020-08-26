//import 'package:flutter/material.dart';
//import 'package:app/models/goods.dart';
//import 'package:app/route/routes.dart';
//import 'package:app/view/custom_view.dart';
//class CardGoods extends StatelessWidget {
//  final List<GoodsItem> goodsModleDataList;
//  String imgUrl = "http://linjiashop-mobile-api.microapp.store/file/getImgStream?idFile=";
//  CardGoods({Key key, this.goodsModleDataList}) :super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        color:Colors.white,
//        margin: EdgeInsets.only(top: 5.0),
//        padding:EdgeInsets.all(3.0),
//        child:  _buildWidget(context)
//    );
//  }
//  Widget _buildWidget(BuildContext context) {
//    List<Widget> mGoodsCard = [];
//    Widget content;
//    for (int i = 0; i < goodsModleDataList.length; i++) {
//      double priceDouble = goodsModleDataList[i].goodsPrice;
//      mGoodsCard.add(InkWell(
//          onTap: () {
//            onItemClick(context,i);
//          },
//          child: ThemeCard(
//            title: goodsModleDataList[i].goodsTitle,
//            price:"¥"+priceDouble.toStringAsFixed(2) ,
//            imgUrl:goodsModleDataList[i].goodsPic,
//            descript: goodsModleDataList[i].goodsIntroduce,
//            number: goodsModleDataList[i].goodsSales.toString(),
//          )
//      )
//      );
//    }
//    content = Column(
//      children: mGoodsCard,
//    );
//    return content;
//  }
//
//  void onItemClick(BuildContext context,int i){
//    String id = goodsModleDataList[i].goodsId;
//    Map<String, String> p={"id":id};
////    Routes.instance.navigateToParams(context,Routes.PRODUCT_DETAILS,params: p);
//  }
//}