import 'package:app/application.dart';
//import 'package:app/provider/user_model.dart';
import 'package:app/utils/app_size.dart';
import 'package:app/utils/navigator_util.dart';
import 'package:app/utils/url_lanch_utils.dart';
import 'package:app/widgets/widget_lite.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsuper/fsuper.dart';
//import 'package:provider/provider.dart';

class ToolsPage extends StatefulWidget {
  @override
  _ToolsPageState createState() => _ToolsPageState();
}

//Widget _buildXuanpinTools(BuildContext context) {
//  return FSuper(
//    text: '选品工具',
//    padding: EdgeInsets.only(top: 50, bottom: 5),
//    margin: EdgeInsets.all(10.0),
////    textAlignment: Alignment.bottomCenter,
//    child1: Image.network(
//        'https://img.alicdn.com/imgextra/i3/2053469401/O1CN016LSPRa2JJi06FDPGB_!!2053469401.gif'),
//    child1Alignment: Alignment.topCenter,
//    child1Margin: EdgeInsets.only(top: 0, bottom: 10),
//  );
//}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: Icon(Icons.settings),
        title: Text(
          '淘友工具',
          style: TextStyle(fontSize: AppSize.sp(30.0)),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildXuanpinToolsSuper(),
            buildMiddleMargin(),
            _buildSettingToolsSuper(),
          ],
        ),
      ),
    );
  }

  Widget _buildXuanpinTools2() {
    return FSuper(
      text: '收藏夹',
      padding: EdgeInsets.only(top: 30, bottom: 5),
      margin: EdgeInsets.all(10.0),
//    textAlignment: Alignment.bottomCenter,
      child1: Icon(
        Icons.favorite,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
    );
  }
  Widget _buildSearch() {
    return FSuper(
      text: '搜索',
      padding: EdgeInsets.only(top: 30, bottom: 5),
      margin: EdgeInsets.all(10.0),
      child1: Icon(
        CupertinoIcons.search,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
      onChild1Click: () {
        NavigatorUtil.goSearchPage(context);
      },
    );
  }
  Widget _buildRealtimeMessage() {
    return FSuper(
      text: '实时线报',
      padding: EdgeInsets.only(top: 30, bottom: 5),
      margin: EdgeInsets.all(10.0),
      child1: Icon(
        CupertinoIcons.news,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
      onChild1Click: () {
        NavigatorUtil.goRealTimeMessagePage(context);
      },
    );
  }

  Widget _buildXuanpinTools3() {
    return FSuper(
      text: '淘礼金',
      padding: EdgeInsets.only(top: 30, bottom: 5),
      margin: EdgeInsets.all(10.0),
//    textAlignment: Alignment.bottomCenter,
      child1: Icon(
        Icons.card_giftcard,
//          CupertinoIcons,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
      onChild1Click: () {
        NavigatorUtil.goToolsTaolijinCreatePage(
            context); //,id: '222',title: '最少5个字'
      },
    );
  }

  Widget _buildXuanpinToolsSuper() {
    return FSuper(
      width: AppSize.width(750),
      height: AppSize.height(500.0),
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      margin: EdgeInsets.only(top: 10.0),
      text: '选品工具',
//    backgroundColor: Color(0xffFF7043),
      corner: Corner.all(5),
      cornerStyle: CornerStyle.round,
      child1: FDottedLine(
        color: Colors.white,
        width: AppSize.width(700),
      ),
      child1Margin: EdgeInsets.only(top: 38.0, left: 20.0, right: 20.0),
      child1Alignment: Alignment.topCenter,
      child2: Row(
        children: [
//        _buildXuanpinTools(context),
//          _buildXuanpinTools2(),
          _buildXuanpinTools3(),
          _buildRealtimeMessage(),
          _buildSearch(),
        ],
      ),
      child2Alignment: Alignment.topLeft,
      child2Margin: EdgeInsets.only(top: 58.0, left: 20),
    );
  }

  Widget _buildSettingTools1() {
    return FSuper(
      text: 'openAPI',
      padding: EdgeInsets.only(top: 30.0, bottom: 5),
      margin: EdgeInsets.all(10.0),
//    textAlignment: Alignment.bottomCenter,
      child1: Icon(
        Icons.settings,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
      onChild1Click: () {
        NavigatorUtil.goOpenAPISettingPage(context); //,id: '222',title: '最少5个字'
      },
    );
  }

  Widget _buildTaobaoAuthTools1() {
    return FSuper(
      text: '淘宝授权',
      padding: EdgeInsets.only(top: 30, bottom: 5),
      margin: EdgeInsets.all(10.0),
//    textAlignment: Alignment.bottomCenter,
      child1: Icon(
        Icons.supervisor_account,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
      onChild1Click: () {
//      NavigatorUtil.goOpenAPISettingPage(context);
        String _userToken = Application.sp.getString('userToken') ?? '';
        if (_userToken != '') {
//      https://oauth.m.taobao.com/authorize?response_type=code&client_id=23530087&redirect_uri=http://openapi.lyhuilin.com/sdk/taobao/AuthGet&state=cdb9c5f5-de12-4ea1-4de0-add1ab1e2db9&view=wap
          String _url =
              '//oauth.m.taobao.com/authorize?response_type=code&client_id=23530087&redirect_uri=https://vip.lyhuilin.com/sdk/taobao/AuthGet&state=$_userToken&view=wap';
          UrlLaunchUtils.launchURL("taobao:$_url").catchError((e) {
            UrlLaunchUtils.launchURL("https:$_url").catchError((e) {
              buildshowDialog(context, "打开手淘失败，授权网址已复制到剪切板，请使用浏览器尝试打开$e");
              Clipboard.setData(ClipboardData(text: 'https:$_url'));
            });
          });
        } else {
          buildshowDialog(context, '获取授权地址失败(userToken为空)，请重新登录！');
//          NavigatorUtil.goLoginPage(context);
        }
      },
    );
  }

  Widget _buildWeipinhuiAuthTools1() {
    return FSuper(
      text: '唯品会授权',
      padding: EdgeInsets.only(top: 30, bottom: 5),
      margin: EdgeInsets.all(10.0),
//    textAlignment: Alignment.bottomCenter,
      child1: Icon(
        Icons.supervisor_account,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
      onChild1Click: () {
//      NavigatorUtil.goOpenAPISettingPage(context);
        String _userToken = Application.sp.getString('userToken') ?? '';
        if (_userToken != '') {
//          https://auth.vip.com/oauth2/authorize?client_id=YOUR_CLIENT_ID&response_type=code&redirect_uri=YOUR_REGISTERED_REDIRECT_URI 如果用户同意授权,页面跳转至 YOUR_REGISTERED_REDIRECT_URI/?code=CODE
//      https://oauth.m.taobao.com/authorize?response_type=code&client_id=23530087&redirect_uri=http://openapi.lyhuilin.com/sdk/taobao/AuthGet&state=cdb9c5f5-de12-4ea1-4de0-add1ab1e2db9&view=wap
          String _url =
              '//auth.vip.com/oauth2/authorize?response_type=code&client_id=a762893d&redirect_uri=https://vip.lyhuilin.com/sdk/weipinhui/AuthGet&state=$_userToken&view=wap';
          UrlLaunchUtils.launchURL("https:$_url").catchError((e) {
            UrlLaunchUtils.launchURL("https:$_url").catchError((e) {
              buildshowDialog(context, "打开唯品会失败，授权网址已复制到剪切板，请使用浏览器尝试打开$e");
              Clipboard.setData(ClipboardData(text: 'https:$_url'));
            });
          });
        } else {
          buildshowDialog(context, '获取授权地址失败(userToken为空)，请重新登录！');
//          NavigatorUtil.goLoginPage(context);
        }
      },
    );
  }

  Widget _buildLoginTools1() {
    return FSuper(
      text: '登录账户',
      padding: EdgeInsets.only(top: 30, bottom: 5),
      margin: EdgeInsets.all(10.0),
//    textAlignment: Alignment.bottomCenter,
      child1: Icon(
        Icons.login,
        size: AppSize.sp(69.0),
      ),
      child1Alignment: Alignment.topCenter,
      child1Margin: EdgeInsets.only(top: 0, bottom: 10),
      onChild1Click: () {
        NavigatorUtil.goLoginPage(context);
      },
    );
  }

  Widget _buildSettingToolsSuper() {
    return FSuper(
      width: AppSize.width(750),
      height: AppSize.height(500.0),
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      margin: EdgeInsets.only(top: 10.0),
      text: '配置工具',
//    backgroundColor: Color(0xffFF7043),
      corner: Corner.all(5),
      cornerStyle: CornerStyle.round,
      child1: FDottedLine(
        color: Colors.white,
        width: AppSize.width(700),
      ),
      child1Margin: EdgeInsets.only(top: 38.0, left: 20.0, right: 20.0),
      child1Alignment: Alignment.topCenter,
      child2: Row(
        children: [
          _buildSettingTools1(),
          _buildTaobaoAuthTools1(),
          _buildWeipinhuiAuthTools1(),
          _buildLoginTools1(),
        ],
      ),
      child2Alignment: Alignment.topLeft,
      child2Margin: EdgeInsets.only(top: 58.0, left: 20.0, right: 20.0),
    );
  }
}
