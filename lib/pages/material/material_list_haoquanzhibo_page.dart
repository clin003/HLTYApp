import 'package:app/models/material_id_list.dart';
import 'package:app/pages/goods_list/goods_list_with_material_id_v2.dart';
import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MaterialListHaoquanzhiboPage extends StatefulWidget {
  @override
  _MaterialListHaoquanzhiboPageState createState() =>
      _MaterialListHaoquanzhiboPageState();
}

class _MaterialListHaoquanzhiboPageState
    extends State<MaterialListHaoquanzhiboPage>
    with SingleTickerProviderStateMixin {
//   vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
//   当使用vsync: this的时候，State对象必须with SingleTickerProviderStateMixin 或 TickerProviderStateMixin；TickerProviderStateMixin适用于多AnimationController的情况。

  TabController _tabController;
  List<MaterialIdItem> tabs = [
    MaterialIdItem(catName: '综合', id: '3756', name: '好券直播', totalResults: 200),
    MaterialIdItem(catName: '女装', id: '3767', name: '好券直播', totalResults: 200),
    MaterialIdItem(
        catName: '家居家装', id: '3758', name: '好券直播', totalResults: 200),
    MaterialIdItem(
        catName: '数码家电', id: '3759', name: '好券直播', totalResults: 200),
    MaterialIdItem(
        catName: '鞋包配饰', id: '3762', name: '好券直播', totalResults: 200),
    MaterialIdItem(
        catName: '美妆个护', id: '3763', name: '好券直播', totalResults: 200),
    MaterialIdItem(catName: '男装', id: '3764', name: '好券直播', totalResults: 200),
    MaterialIdItem(catName: '内衣', id: '3765', name: '好券直播', totalResults: 200),
    MaterialIdItem(catName: '母婴', id: '3760', name: '好券直播', totalResults: 200),
    MaterialIdItem(catName: '食品', id: '3761', name: '好券直播', totalResults: 200),
    MaterialIdItem(
        catName: '运动户外', id: '3766', name: '好券直播', totalResults: 200),
  ];
  String title = '好券直播';

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
          return MaterialIdGoodsList(
            id: e.id,
            title: '${e.name} ${e.catName}',
            totalResults: e.totalResults,
          );
        }).toList(),
      ),
    );
  }
}
