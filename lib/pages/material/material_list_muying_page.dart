import 'package:app/models/material_id_list.dart';
import 'package:app/pages/goods_list/goods_list_with_material_id_v2.dart';
import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MaterialListMuyingPage extends StatefulWidget {
  @override
  _MaterialListMuyingPageState createState() => _MaterialListMuyingPageState();
}

class _MaterialListMuyingPageState extends State<MaterialListMuyingPage>  with SingleTickerProviderStateMixin{
//   vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
//   当使用vsync: this的时候，State对象必须with SingleTickerProviderStateMixin 或 TickerProviderStateMixin；TickerProviderStateMixin适用于多AnimationController的情况。

  TabController _tabController;
  List<MaterialIdItem> tabs=[
    MaterialIdItem(catName: '母婴_备孕',id: '4040',name: '母婴主题',totalResults: 1000),
    MaterialIdItem(catName: '母婴_0至6个月',id: '4041',name: '母婴主题',totalResults: 1000),
    MaterialIdItem(catName: '母婴_7至12个月',id: '4042',name: '母婴主题',totalResults: 1000),
    MaterialIdItem(catName: '母婴_1至3岁',id: '4043',name: '母婴主题',totalResults: 1000),
    MaterialIdItem(catName: '母婴_4至6岁',id: '4044',name: '母婴主题',totalResults: 1000),
    MaterialIdItem(catName: '母婴_7至12岁',id: '4045',name: '母婴主题',totalResults: 1000),
  ];
  String title='辣妈优选';
  String subTitle='从备孕到育儿，宝宝所需一站购全';

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
