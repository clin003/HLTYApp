import 'package:app/models/material_id_list.dart';
import 'package:app/pages/goods_list/goods_list_with_material_id_v2.dart';
import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MaterialListBendishenghuoPage extends StatefulWidget {
  @override
  _MaterialListBendishenghuoPageState createState() => _MaterialListBendishenghuoPageState();
}

class _MaterialListBendishenghuoPageState extends State<MaterialListBendishenghuoPage>  with SingleTickerProviderStateMixin{
//   vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
//   当使用vsync: this的时候，State对象必须with SingleTickerProviderStateMixin 或 TickerProviderStateMixin；TickerProviderStateMixin适用于多AnimationController的情况。

  TabController _tabController;
  List<MaterialIdItem> tabs=[
    MaterialIdItem(catName: '今日爆款',id: '30443',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '淘票票',id: '19812',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '优酷会员',id: '28636',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '喜马拉雅',id: '29105',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '阿里健康-疫苗预约',id: '25885',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '阿里健康-体检',id: '25886',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '阿里健康-口腔',id: '25888',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '阿里健康-基因检测',id: '25890',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '口碑-肯德基/必胜客/麦当劳',id: '19810',name: '本地生活',totalResults: 200),
//    MaterialIdItem(catName: '口碑-生活服务',id: '28888',name: '本地生活',totalResults: 200),//无数据
    MaterialIdItem(catName: '天猫无忧-家政服务',id: '19814',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '飞猪-签证',id: '26077',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '飞猪-酒店',id: '27913',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '飞猪-自助餐',id: '27914',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '飞猪-门票',id: '19811',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '大麦网-演出/演唱会/剧目/会展',id: '25378',name: '本地生活',totalResults: 200),
    MaterialIdItem(catName: '汽车定金',id: '28397',name: '本地生活',totalResults: 200),
  ];
  String title='本地生活';

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
