import 'package:app/models/material_id_list.dart';
import 'package:app/pages/goods_list/goods_list_with_material_id_v2.dart';
import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MaterialListShishirexiaoPage extends StatefulWidget {
  @override
  _MaterialListShishirexiaoPageState createState() => _MaterialListShishirexiaoPageState();
}

class _MaterialListShishirexiaoPageState extends State<MaterialListShishirexiaoPage>  with SingleTickerProviderStateMixin{
//   vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
//   当使用vsync: this的时候，State对象必须with SingleTickerProviderStateMixin 或 TickerProviderStateMixin；TickerProviderStateMixin适用于多AnimationController的情况。

  TabController _tabController;
  List<MaterialIdItem> tabs=[
    MaterialIdItem(catName: '综合',id: '28026',name: '实时热销',totalResults: 500),
    MaterialIdItem(catName: '服饰',id: '28029',name: '实时热销',totalResults: 500),
    MaterialIdItem(catName: '快消',id: '28027',name: '实时热销',totalResults: 500),
    MaterialIdItem(catName: '电器美家',id: '28028',name: '实时热销',totalResults: 500),
  ];
  String title='实时热销榜';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: tabs.length,vsync: this);
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
      appBar: AppBar(title: Text('$title',style: TextStyle(fontSize: AppSize.sp(33.0)),),
      bottom: TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: tabs.map((e) => Tab(text: e.catName,)).toList(),
      ),
      ),
      body: TabBarView(
          controller: _tabController,

          children: tabs.map((e) {
            return  MaterialIdGoodsList(id: e.id,title: '${e.name} ${e.catName}',totalResults: e.totalResults,);
          }).toList(),
      ),

    );
  }
}
