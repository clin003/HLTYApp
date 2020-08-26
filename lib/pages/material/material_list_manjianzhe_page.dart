import 'package:app/models/material_id_list.dart';
import 'package:app/pages/goods_list/goods_list_with_material_id_v2.dart';
import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MaterialListManjianzhePage extends StatefulWidget {
  @override
  _MaterialListManjianzhePageState createState() => _MaterialListManjianzhePageState();
}

class _MaterialListManjianzhePageState extends State<MaterialListManjianzhePage>  with SingleTickerProviderStateMixin{
//   vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
//   当使用vsync: this的时候，State对象必须with SingleTickerProviderStateMixin 或 TickerProviderStateMixin；TickerProviderStateMixin适用于多AnimationController的情况。

  TabController _tabController;
  List<MaterialIdItem> tabs=[
    MaterialIdItem(catName: '内部捡漏福利第二件0元',id: '27161',name: '猫超优质爆款',totalResults: 200),
    MaterialIdItem(catName: '猫超满减满折',id: '27160',name: '满减满折',totalResults: 200),
    MaterialIdItem(catName: '聚划算满减满折',id: '32366',name: '满减满折',totalResults: 200),
//    MaterialIdItem(catName: '猫超单件满减包邮',id: '27160',name: '猫超优质爆款',totalResults: 200),
    MaterialIdItem(catName: '猫超1元购凑单',id: '27162',name: '猫超优质爆款',totalResults: 200),
  ];
  String title='猫超/聚划算满减满折';

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
