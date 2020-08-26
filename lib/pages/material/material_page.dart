import 'package:app/pages/goods_list/goods_list_with_material_id_v2.dart';
import 'package:app/utils/app_size.dart';
import 'package:flutter/material.dart';

class MaterialIDPage extends StatelessWidget {
  final String id;
  final String title;
  final int totalResults;
  MaterialIDPage({this.id="27161",this.title='猫超第二件0元',this.totalResults=200});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title',style: TextStyle(fontSize: AppSize.sp(33.0)),),
      ),
      body: MaterialIdGoodsList(id: id,title: title,totalResults:totalResults),
    );
  }
}
