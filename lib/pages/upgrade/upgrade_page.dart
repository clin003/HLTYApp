import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_upgrade/flutter_app_upgrade.dart';
import 'package:app/apifetch/app_version_json_api.dart';
import 'package:fsuper/fsuper.dart';

bool _isCanUpgrade = true;
AppInfo _appInfo;

class UpgradePage extends StatefulWidget {
  @override
  _UpgradePageState createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  String _iosAppId = 'id1528499688';
//  List<AppMarketInfo> _appMarketList = [];
  String _installMarkets = '';
  @override
  void initState() {
    // TODO: implement initState
    _loadData();

    super.initState();
  }

  _loadData() async {
    if (!_isCanUpgrade) return;
//    _getAppInfo()
    var appInfo = await FlutterUpgrade.appInfo;
    setState(() {
      _appInfo = appInfo;
    });

    _checkAppUpgrade();
  }

  Future<AppUpgradeInfo> _checkAppInfo() async {
    return AppVersionJsonDio.fetch().then((value) {
//      LogUtil.v(
//          'UpgradePage>>_checkAppInfo\n'
//              '(_appInfo.versionName:${_appInfo.versionName}):${(_appInfo.versionName ?? '')},(version:${value.version})${(value.version ?? '')},\n'
//          '(bool)${(value != null && _appInfo != null && (_appInfo.versionName ?? '') != (value.version ?? ''))}\n'
//              '(bool): (${_appInfo.versionName} ?? '') != (${value.version} ?? '')${ (_appInfo.versionName ?? '') != (value.version ?? '')}\n');
      if (value != null &&
          _appInfo != null &&
          (_appInfo.versionName ?? '') != (value.version ?? '')) {
        return AppUpgradeInfo(
            title: value.title,
            contents: value.contents,
            force: value.force, //
            apkDownloadUrl: value.apkDownloadUrl);
      }
      return null;
    });
  }

//  Future<AppUpgradeInfo> _checkAppInfo() async {
//    //这里一般访问网络接口，将返回的数据解析成如下格式
//    return Future.delayed(Duration(seconds: 1), () {
//      return AppUpgradeInfo(
//        title: '新版本V1.1.1',
//        contents: [
//          '1、支持立体声蓝牙耳机，同时改善配对性能',
//          '2、提供屏幕虚拟键盘',
//          '3、更简洁更流畅，使用起来更快',
//          '4、修复一些软件在使用时自动退出bug',
//          '5、新增加了分类查看功能'
//        ],
//        force: false,
//      );
//    });
//  }

  _checkAppUpgrade() {
    AppUpgrade.appUpgrade(
      context,
      _checkAppInfo(),
      cancelText: '以后再说',
      okText: '马上升级',
      iosAppId: '$_iosAppId',
//      appMarketInfo: AppMarket.meiZu,
      onCancel: () {
        _isCanUpgrade = false;
//        LogUtil.v('onCancel');
      },
      onOk: () {
//        LogUtil.v('onOk');
      },
      downloadProgress: (count, total) {
//        LogUtil.v('count:$count,total:$total');
      },
      downloadStatusChange: (DownloadStatus status, {dynamic error}) {
//        LogUtil.v('status:$status,error:$error');
      },
    );
  }

//  Future<AppUpgradeInfo> _checkAppInfo() async {
//    //这里一般访问网络接口，将返回的数据解析成如下格式
//    return Future.delayed(Duration(seconds: 1), () {
//      return AppUpgradeInfo(
//        title: '新版本V1.1.1',
//        contents: [
//          '1、支持立体声蓝牙耳机，同时改善配对性能',
//          '2、提供屏幕虚拟键盘',
//          '3、更简洁更流畅，使用起来更快',
//          '4、修复一些软件在使用时自动退出bug',
//          '5、新增加了分类查看功能'
//        ],
//        force: false,
//      );
//    });
//  }

//  _getAppInfo() async {
//    var appInfo = await FlutterUpgrade.appInfo;
//    setState(() {
//      _appInfo = appInfo;
//    });
//  }

//  _getInstallMarket() async {
//    List<String> marketList = await FlutterUpgrade.getInstallMarket();
//    marketList.forEach((f) {
//      _installMarkets += '$f,';
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Container();
    return FSuper(
      text:
          '版本号:${_appInfo?.versionName}(内部Code:${_appInfo?.versionCode})', //${_appInfo?.packageName}
      textSize: AppSize.sp(20.0),
    );

//      Container(
//      child: Column(
//        children: <Widget>[
//          Text('packageName:${_appInfo?.packageName}'),
//          Text('versionName:${_appInfo?.versionName}'),
//          Text('versionCode:${_appInfo?.versionCode}'),
//          Text('安装的应用商店:$_installMarkets'),
//        ],
//      ),
//    );
  }
}
