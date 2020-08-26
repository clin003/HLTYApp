这是一个基于Flutter的项目。

## 介绍

    用于淘宝客自助选品导购
    【慧林淘友——专门提供购物优惠券供选择】
    1、首页，海量优惠商品供你选择。
    2、发现页，采用模糊搜索，使商品搜索结果更加完善，搜索找优惠更方便。
    3、首页多种板块，多种风格，迎合每位用户喜爱。
    4、每天会更新上百款带有内部优惠券的商品，数量多，产品全。

    【特色工具】
    1、生成淘礼金，一键复制；
    2、推送到慧广播，方便精选导购；
    3、生成淘口令，随时复制随时粘贴；

    【有问题——来这里找我们】
    慧林淘友官网：http://www.lyhuilin.com
    交流QQ群：153690156

## 前言

Q：为什么会有这个项目？

> 了解到了flutter这个框架，并且慧林淘友淘客助手需要一个app版选品工具，所以就有了。


Q：数据从哪里来？

> 慧林淘友apiClient提供接口。

## 功能模块

- 选品功能
    - 首页
    - 发现
    - 实时线报
-  淘客工具  
    - 淘礼金生成
-   推客授权
    - 淘宝授权/唯品会授权
    - 慧林淘友账号登录

## 技术选型
- 核心框架：flutter 1.22
- 数据存储：shared_preferences
- 屏幕适配：flutter_screenutil
- 路由管理：fluro
- 网络请求：dio
- toast：fluttertoast
- 网页跳转：url_launcher

## 已完成

 * 首页轮播
 * 首页导航
 * 商品列表展示
 * 搜索功能
 * 淘礼金生成工具
 * 实时线报同步功能
 * 淘宝/唯品会授权
 * 慧林淘友账号登录

## 下载体验 - ~~ios/android都可下载~~ 仅安卓可直接体验

> 交流群文件可直接下载。

> 有bug欢迎提issues。

## 关于
 * 如何支持作者：点击右上角的"start" 的按钮，是对作者的最大支持。
 * 想给作者提建议：点击上面"Issues"按钮，新增即可.[地址](https://gitee.com/lyhuilin/HLTYApp/issues)

## 技术交流
- QQ群：623826971
- 微信：lyhuilin,添加请备注：慧林淘友App

##  gitee地址

https://gitee.com/lyhuilin/HLTYApp

## github地址

https://github.com/clin003/HLTYApp

## flutter版本信息

``` sh
flutter --verison
```

``` sh
Flutter version 1.22.0-2.0.pre.59
```

## 安装

这个项目使用 [flutter](https://github.com/flutter/flutter). 请确保你本地安装了它们。

1. 检查版本号是否正确
```sh
flutter --version
```

2. 运行一下命令查看是否需要安装其他依赖
``` sh
flutter doctor
```

3. 运行启动
```
flutter pub get
flutter run
```