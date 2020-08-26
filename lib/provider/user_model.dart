import 'dart:convert';

import 'package:app/widgets/widget_lite.dart';
import 'package:flutter/material.dart';
import 'package:app/application.dart';
import 'package:app/models/user.dart';
import 'package:app/utils/net_utils.dart';
import 'package:app/utils/utils.dart';

class UserModel with ChangeNotifier {
  User _user;

  User get user => _user;

  /// 初始化 User
  void initUser() {
    if (Application.sp.containsKey('user')) {
      String s = Application.sp.getString('user');
      _user = User.fromJson(json.decode(s));
    }
  }

  /// 登录
  Future<User> login(BuildContext context, String phone, String pwd) async {
    User user = await NetUtils.login(context, phone, pwd);
    if (user.code > 0) {
      Utils.showToast(user.message ?? '登录失败，请检查账号密码');
      return null;
    }
    Utils.showToast(user.message ?? '登录成功');
    _saveUserInfo(user);
    return user;
  }

  /// 注册
  Future<User> register(
      BuildContext context, String phone, String pwd, String email) async {
    User user = await NetUtils.register(context, phone, pwd, email);
    if (user.code > 0) {
      Utils.showToast(user.message ?? '注册失败，请检查账号、邮箱或密码信息');
      return null;
    }
    Utils.showToast(user.message ?? '注册成功');
//    buildshowDialog(context, user.message ?? '注册成功');
    _saveUserInfo(user);
    return user;
  }

  /// 保存用户信息到 sp
  _saveUserInfo(User user) {
    _user = user;
    Application.sp.setString('user', json.encode(user.toJson()));
    if (user?.data.token!=null){
      Application.sp.setString('userToken', user.data.token);
    }
  }
}
