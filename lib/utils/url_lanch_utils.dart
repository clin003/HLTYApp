//import 'dart:ui';

import 'package:app/apifetch/taobao.tbk.tpwd.create_api.dart';
import 'package:app/application.dart';
import 'package:app/models/openapi_response.dart';
import 'package:app/utils/log_util.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

//QQ： mqq:// 
//微信： weixin:// 
//京东： openapp.jdmoble:// 
//淘宝： taobao:// 
//美团： imeituan:// 
//点评： dianping:// 
//1号店： wccbyihaodian:// 
//支付宝： alipay:// 
//微博： sinaweibo:// 
//腾讯微博： TencentWeibo:// 
//weico微博： weico:// 
//知乎： zhihu:// 
//豆瓣fm： doubanradio:// 
//网易公开课： ntesopen:// 
//Chrome： googlechrome:// 
//QQ浏览器： mqqbrowser:// 
//uc浏览器： ucbrowser:// 
//搜狗浏览器： SogouMSE:// 
//百度地图： baidumap:// bdmap:// 
//优酷： youku:// 
//人人： renren:// 
//我查查： wcc:// 
//有道词典： yddictproapp:// 
//微盘： sinavdisk:// 
//名片全能王： camcard://


class UrlLaunchUtils {

 static Future<void> launchURL(String url) async {
//    const url = 'xxx'; // 这个xx就是唤起三方应用的重要因素
   bool _banChickUrl= Application.sp.getBool("banChickUrl");
   if (url.startsWith("http") && _banChickUrl){
     LogUtil.v('UrlLaunchUtils:launchURL>>\n'
         '_url:$url\n'
         '_banChickUrl:$_banChickUrl');
   }else{
     if (await canLaunch(url)) { // 判断当前手机是否安装某app. 能否正常跳转
       await launch(url);
     } else {
       throw 'Could not launch $url';
     }
   }

  }
 static Future<void> launchURLWithScheme(String url,{String scheme='https:',String text='',Function errDialog}) async {
  bool _banChickUrl= Application.sp.getBool("banChickUrl");
   String _url = '$url';
   LogUtil.v('UrlLaunchUtils:launchURLWithScheme>>\n'
       '_url:$_url');
   if (_url.startsWith("https://")){
     _url = _url.replaceAll('https://', '//');
   }else if (_url.startsWith("http://")){
     _url = _url.replaceAll('http://', '//');
   }

   LogUtil.v('UrlLaunchUtils:launchURLWithScheme(replace)>>\n'
       '_url:$_url(url)$url\n'
      );
   String _text=text??'';
   if (scheme.startsWith('taobao')  ){
     if (url!=""){
       OpenAPIResponseModel entity2=await TbkTpwdCreateRequestAPI.fetch(url);
       if (entity2?.code!=null && entity2.code==0){
         _text='8緮置内容'
             '${entity2.data}'
//           '$_text'
             '达开τao寶或掂击炼接 $url 至浏.览览.器';
       }
     }

   }else if (_text==""){
     _text='$url';
   }

   Clipboard.setData(ClipboardData(text: '$_text'));
   if (_banChickUrl   ){
     if (_text!=""){
       errDialog(_text);
     }
   }else if (url!=""){
     UrlLaunchUtils.launchURL("$scheme$_url").catchError((e) {
       UrlLaunchUtils.launchURL("$url").catchError((e) {
         errDialog(e);
         Clipboard.setData(ClipboardData(text: 'https:$url'));
       });
     });
   }

 }

//  static  Future<void> launchInBrowser(String url) async {
//    if (await canLaunch(url)) {
//      await launch(
//        url,
//        forceSafariVC: false,
//        forceWebView: false,
//        headers: <String, String>{'my_header_key': 'my_header_value'},
//      );
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//
//  static  Future<void> launchInWebViewOrVC(String url) async {
//    if (await canLaunch(url)) {
//      await launch(
//        url,
//        forceSafariVC: true,
//        forceWebView: true,
//        headers: <String, String>{'my_header_key': 'my_header_value'},
//      );
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//
//  static  Future<void> launchInWebViewWithJavaScript(String url) async {
//    if (await canLaunch(url)) {
//      await launch(
//        url,
//        forceSafariVC: true,
//        forceWebView: true,
//        enableJavaScript: true,
//      );
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//
//  static  Future<void> launchInWebViewWithDomStorage(String url) async {
//    if (await canLaunch(url)) {
//      await launch(
//        url,
//        forceSafariVC: true,
//        forceWebView: true,
//        enableDomStorage: true,
//      );
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//
//  static Future<void> launchUniversalLinkIos(String url) async {
//    if (await canLaunch(url)) {
//      final bool nativeAppLaunchSucceeded = await launch(
//        url,
//        forceSafariVC: false,
//        universalLinksOnly: true,
//      );
//      if (!nativeAppLaunchSucceeded) {
//        await launch(
//          url,
//          forceSafariVC: true,
//        );
//      }
//    }
//  }
//
//  static  Widget launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
//    if (snapshot.hasError) {
//      return Text('Error: ${snapshot.error}');
//    } else {
//      return const Text('');
//    }
//  }
//
//  static  Future<void> makePhoneCall(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }

}