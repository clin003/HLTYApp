import 'package:app/pages/goods_list/goods_list_filter.dart';

import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MateriaFilterList9kuai9Page extends StatefulWidget {
  @override
  _MateriaFilterList9kuai9PageState createState() =>
      _MateriaFilterList9kuai9PageState();
}

class FilterData {
  FilterData({
    this.price,
    this.pricemax,
    this.sales,
    this.catName,
  });

  final int price;
  final int pricemax;
  final int sales;
  final String catName;
}

class _MateriaFilterList9kuai9PageState
    extends State<MateriaFilterList9kuai9Page>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<FilterData> tabs = [
    FilterData(price: 1, pricemax: 20, sales: 200000, catName: "热卖"),
    FilterData(price: 0, pricemax: 6, sales: 20000, catName: "5.9元区"),
    FilterData(price: 6, pricemax: 10, sales: 10000, catName: "9.9元区"),
    FilterData(price: 10, pricemax: 20, sales: 10000, catName: "19.9元区"),
  ];
  String title = '9.9包邮';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title',
          style: TextStyle(fontSize: AppSize.sp(33.0)),
        ),
        bottom: TabBar(
//          indicatorWeight: 1.5,
//          indicatorColor: Colors.white70,
          isScrollable: true,
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e.catName,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return FilterGoodsList(
            price: e.price,
            pricemax: e.pricemax,
            sales: e.sales,
          );
        }).toList(),
      ),
    );
  }
}
