//import 'dart:convert';

import 'package:app/utils/app_size.dart';
import 'package:app/widgets/widget_lite.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:app/provider/user_model.dart';
import 'package:app/utils/navigator_util.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/common_button.dart';
import 'package:app/widgets/tips_button.dart';
import 'package:app/widgets/v_empty_view.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 50), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: AppSize.width(80),
            right: AppSize.width(80),
            top: AppSize.width(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/icon_logo.png',
                    width: AppSize.width(90),
                    height: AppSize.width(90),
                  ),
                ),
                onTap: () {
                  NavigatorUtil.goHomePage(context);
                },
              ),
              _LoginAnimatedWidget(
                animation: _animation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginWidget extends StatefulWidget {
  @override
  __LoginWidgetState createState() => __LoginWidgetState();
}

class __LoginWidgetState extends State<_LoginWidget> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: AppSize.width(30)),
            child: Text(
              '欢迎回来，请登录!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 34,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: AppSize.width(3)),
            child: Text(
              '慧林淘友',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          VEmptyView(50),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: '手机号',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: Colors.grey,
                )),
          ),
          VEmptyView(40),
          TextField(
            obscureText: true,
            controller: _pwdController,
            decoration: InputDecoration(
                hintText: '密码',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                )),
          ),
          VEmptyView(120),
          Consumer<UserModel>(
            builder: (BuildContext context, UserModel value, Widget child) {
              return CommonButton(
                callback: () {
                  String phone = _phoneController.text;
                  String pwd = _pwdController.text;
                  if (phone.isEmpty || pwd.isEmpty) {
//                    Utils.showToast('请输入账号或者密码');
                    buildshowDialog(context, "请输入账号或者密码");
                    return;
                  }
                  value
                      .login(
                    context,
                    phone,
                    pwd,
                  )
                      .then((value) {
                    if (value != null) {
                      // Provider.of<PlayListModel>(context).user = value;
                      NavigatorUtil.goHomePage(context);
                    }
                  });
                },
                content: '登录',
                width: double.infinity,
              );
            },
          ),
          VEmptyView(10),
          TipsButton(
            callback: () {
              NavigatorUtil.goRegisterPage(context);
            },
            content: '还没有帐号，去注册',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class _LoginAnimatedWidget extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 40, end: 0);
  final Animation animation;

  _LoginAnimatedWidget({
    @required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
        child: _LoginWidget(),
      ),
    );
  }
}
