import 'package:app/pages/upgrade/upgrade_page.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的账户(建设中……)'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            FSuper(
              text: '建设中……(交流QQ群号：153690156)',
            ),
            UpgradePage(),
          ],
        ),
      ),
    );
  }
}
