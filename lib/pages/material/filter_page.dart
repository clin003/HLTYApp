import 'package:app/pages/goods_list/goods_list_filter.dart';
import 'package:app/pages/goods_list/goods_list_with_material_id_v2.dart';
import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MaterialFilterPage extends StatelessWidget {
  final int price;
  final int pricemax;
  final int sales;
  final String title;

  MaterialFilterPage({this.title,this.price = 0, this.pricemax = 10, this.sales = 10000});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title',style: TextStyle(fontSize: AppSize.sp(33.0)),),
      ),
      body: FilterGoodsList(price: price,pricemax: pricemax,sales: sales,),
    );
  }
}
