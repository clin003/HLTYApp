import 'package:app/utils/app_size.dart';
//import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/goods_list/goods_list_search.dart';

class SearchDataPage extends StatefulWidget {
  final String text;
  SearchDataPage({
    this.text = '',
  });
  @override
  _SearchDataPageState createState() => _SearchDataPageState();
}

class _SearchDataPageState extends State<SearchDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "${widget.text}_搜索",
            style: TextStyle(fontSize: AppSize.sp(30.0)),
          )
          ),
      body: SearchGoodsList(
        query: "${widget.text}",
      ),
    );
  }
}
