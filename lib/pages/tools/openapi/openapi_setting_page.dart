import 'package:app/application.dart';
import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';

import 'package:app/widgets/widget_lite.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpenAPISettingPage extends StatefulWidget {
  @override
  _OpenAPISettingPageState createState() => _OpenAPISettingPageState();
}

class _OpenAPISettingPageState extends State<OpenAPISettingPage> {
  TextEditingController _openAPIBaseURLController = TextEditingController();
  TextEditingController _hltyTokenController = TextEditingController();

  TextEditingController _adzoneIdController = TextEditingController();
  TextEditingController _appkeyController = TextEditingController();
  TextEditingController _appsecretController = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    if (mounted) {
      setState(() {
        _appkeyController.text =
            Application.sp.getString('sdk_taobao_appkey') ?? '';
        _appsecretController.text =
            Application.sp.getString('sdk_taobao_appsecret') ?? '';
        _adzoneIdController.text =
            Application.sp.getString('sdk_taobao_adzoneId') ?? '';
        _openAPIBaseURLController.text = Application.sp.getString('url') ?? '';
        _hltyTokenController.text = Application.sp.getString('hlty_token') ??
            (Application.sp.getString('userToken') ?? '');
      });
    }
  }

  void _saveSetting() async {
    Application.sp.setString('sdk_taobao_appkey', _appkeyController.text ?? '');
    Application.sp
        .setString('sdk_taobao_appsecret', _appsecretController.text ?? '');
    Application.sp
        .setString('sdk_taobao_adzoneId', _adzoneIdController.text ?? '');
    Application.sp.setString('url', _openAPIBaseURLController.text ?? '');
    Application.sp.setString('hlty_token', _hltyTokenController.text ?? '');
    buildshowDialog(context, '保存完成');
  }

  Widget _buildFormSaveButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        children: [
          Expanded(
            child: OutlineButton(
              padding: EdgeInsets.all(15.0),
              child: Text("保存配置信息"),
              onPressed: () {
                if ((_formKey.currentState as FormState).validate()) {
                  _saveSetting();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'openAPI配置信息',
          style: TextStyle(fontSize: AppSize.sp(33.0)),
        )),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _openAPIBaseURLController,
                    decoration: InputDecoration(
                      labelText: "openAPI：",
                      hintText: "openAPI地址(外网可访问)",
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  TextFormField(
                    controller: _hltyTokenController,
                    decoration: InputDecoration(
                      labelText: "token：",
                      hintText: "同步验证Token",
                    ),
                  ),
                  ExpansionPanelList(
                    children: <ExpansionPanel>[
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return ListTile(title: Text('淘宝联盟配置(可选)'));
                        },
                        body: Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 0, 15, 15),
                          child: ListBody(
                            children: <Widget>[
                              TextFormField(
                                controller: _appkeyController,
                                decoration: InputDecoration(
                                  labelText: "Appkey：",
                                  hintText: "淘宝联盟开放平台APPKEY",
                                ),
                              ),
                              TextFormField(
                                controller: _appsecretController,
                                decoration: InputDecoration(
                                  labelText: "AppSecret：",
                                  hintText: "淘宝联盟开放平台APPSecret",
                                ),
                              ),
                              TextFormField(
                                controller: _adzoneIdController,
                                decoration: InputDecoration(
                                  labelText: "推广位ID：",
                                  hintText: "例PID(mm_1_2_3)的第三段数字:3",
                                ),
                              ),
                            ],
                          ),
                        ),
                        isExpanded: _isExpanded,
                        canTapOnHeader: true,
                      ),
                    ],
                    expansionCallback: (panelIndex, isExpanded) {
                      setState(() {
                        _isExpanded = !isExpanded;
                      });
                    },
                  ),
                  _buildFormSaveButton(),
                ],
              ),
            ),
          ),
        ));
  }
}
