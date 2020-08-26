import 'package:flutter/material.dart';
import 'package:app/application.dart';
//import 'package:app/provider/user_model.dart';
import 'package:app/utils/navigator_util.dart';
import 'package:app/utils/net_utils.dart';
//import 'package:provider/provider.dart';
import 'package:app/generated/l10n.dart';

import 'package:app/utils/app_size.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _logoController;
  Tween _scaleTween;
  CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
    S.load(Locale('zh', 'CN'));

    _scaleTween = Tween(begin: 0, end: 1);
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300)) //vsync: this,
      ..drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 500), () {
      _logoController.forward();
    });
    _logoAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);

    _logoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          goPage();
        });
      }
    });
    // goPage();
  }

  void goPage() async {
    await Application.initSp();
//    UserModel userModel = Provider.of<UserModel>(context, listen: false);
//    userModel.initUser();
//    if (userModel.user != null) {
//      NavigatorUtil.goHomePage(context);
//    } else {
//      NavigatorUtil.goLoginPage(context);
//    }
    NavigatorUtil.goHomePage(context);
  }

  @override
  Widget build(BuildContext context) {
    NetUtils.init();
    // 初始化屏幕适配包
    AppSize.init(context);
//    ScreenUtil.init( width: 750, height: 1334);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
    // goPage();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ScaleTransition(
          scale: _logoAnimation,
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/images/bg/bg${DateTime.now().month}.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }
}
