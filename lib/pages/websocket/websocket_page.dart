import 'dart:convert';

import 'package:app/apifetch/huiguangbo_msg_push_to_ws_api.dart';
import 'package:app/apifetch/websocket.api.dart';
import 'package:app/apifetch/ws_feed_rich_msg_list_api.dart';
import 'package:app/models/feed_rich_msg_model.dart';
import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/url_lanch_utils.dart';
import 'package:app/widgets/widget_lite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsuper/fsuper.dart';
import 'package:web_socket_channel/io.dart';

///头像计数器
int _headCount = 1;

class WebsocketPage extends StatefulWidget {
  final String title;
  WebsocketPage({Key key, this.title = '实时线报'}) : super(key: key);
  @override
  _WebsocketPageState createState() => _WebsocketPageState();
}

class _WebsocketPageState extends State<WebsocketPage>
//    with AutomaticKeepAliveClientMixin
{
  ScrollController _controller;
  IOWebSocketChannel _channel;
  TextEditingController _controllerText; //= new TextEditingController();

  List<FeedRichMsgModel> _msgList = List();

  @override
  void initState() {
    // TODO: implement initState

    _channel = WebSocketOpenAPI.channel();
    _controllerText = new TextEditingController();
    _controller = new ScrollController();
//    _channelPing();
    _loadData();
    LogUtil.v('initState:WebSocketOpenAPI.channel();$_channel');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _channel.sink.close();
    _controller.dispose();
    _controllerText.dispose();
    LogUtil.v('_channel.sink.close();');
    super.dispose();
  }

//  @override
//  // TODO: implement wantKeepAlive
//  bool get wantKeepAlive => true;



  Future<void> _loadData() {
    WsFeedRichMsgListAPI.fetch().then((value) {
      LogUtil.v('initState:_loadData(value)$value;');
      if (value != null && value.length > 0) {
//        LogUtil.v(
//            'initState:_loadData!= null && value.length > 0(value)$value;');
        if (mounted) {
          setState(() {
            _msgList.addAll(value);
          });
        }
      }
    });
  }

  void _sendMsg() {
    if (_controllerText.text.isNotEmpty) {
      HuiguangboMsgPushToWsDioEx.fetch(textContent: _controllerText.text)
          .then((value) {
        if (value) {
          _controllerText.text = '';
          buildshowDialog(context, '发送成功');
        } else {
          buildshowDialog(context, '发送失败');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
//        leading: Icon(Icons.access_time),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: AppSize.sp(30.0)),
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _sendMsg,
//        tooltip: '按这么长时间干嘛',
//        child: Icon(Icons.send),
//      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new TextField(
          controller: _controllerText,
          autofocus: false,
          maxLines: null,
          maxLength: 200,
          maxLengthEnforced: false,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: _sendMsg,
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          LogUtil.v(
              "WebsocketPage>build>StreamBuilder(snapshot.connectionState)${snapshot.connectionState}");
          switch (snapshot.connectionState) {
            case ConnectionState.done:
//              buildshowDialog(context, '与服务器链接断开，请检查网络或openAPI配置');
              return Center(
                child: Text('与服务器链接已断开，请检查网络或openAPI配置'),
              );
              break;
            case ConnectionState.waiting:
//              return Container(
//                child: Text('等待接收线报数据……'),
//              );
              break;
            case ConnectionState.none:
              return Container(
                child: Text('没有建立连接'),
              );
              break;
            default:
              break;
          }
          if (snapshot.hasError) {
            buildshowDialog(context, '网络错误……与服务器链接断开，请检查网络或openAPI配置');
            return Container(child: Text('网络错误…………'));
          } else if (snapshot.hasData) {
            switch (snapshot.data.runtimeType) {
              case String:
                var _data = snapshot.data;
                FeedRichMsgModel _entity =
                    FeedRichMsgModel.fromJson(json.decode(_data));
                if (_entity != null) {
                  if (_entity?.msgTime == null || _entity.msgTime.isEmpty) {
                    var timeNow = DateTime.now();
                    _entity.msgTime =
                        "${timeNow.year}-${timeNow.month}-${timeNow.day} ${timeNow.hour}:${(timeNow.minute < 10) ? '0${timeNow.minute}' : timeNow.minute}:${(timeNow.second < 10) ? '0${timeNow.second}' : timeNow.second}";
                  }
                  _msgList.insert(0, _entity);
                  if (_msgList.length > 200) {
                    _msgList.removeLast();
                  }
                }

                break;
              default:
                break;
            }
          }
          return ListView.separated(
              controller: _controller,
              itemBuilder: (BuildContext ctx, int index) {
//                LogUtil.v(
//                    "ListView.separated(index)$index,(length)${_msgList.length}");
                return _buildMsgItem(_msgList[index]);
              },
              separatorBuilder: (context, index) {
                return buildMiddleMargin();
              },
              itemCount: _msgList.length);
        },
      ),
    );
  }

  Widget _buildMsgItem(FeedRichMsgModel msgItem) {
    _headCount = _headCount + 1;
    if (_headCount > 16) {
      _headCount = 1;
    }
    List<Widget> _contentWidgetList = List();
    String _content = msgItem.text.content;
    List<String> _contentList = List();
    RegExp _url = new RegExp(r"((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    List<String> _urlList = List();
    Iterable<Match> matches = _url.allMatches(_content);
    for (Match m in matches) {
//      print(m.group(0));
//      LogUtil.v("_buildMsgItem(m.group)${m.group(0)}");
      _urlList.add(m.group(0));
      _content = _content.replaceFirst(m.group(0), "<a/a>");
//      LogUtil.v("_buildMsgItem(_content.replaceFirst)$_content");

//      LogUtil.v(
//          "_buildMsgItem(_contentList.length)${_contentList.length}$_contentList");
    }
    if (_content.contains('<a/a>')) {
      _contentList = _content.split("<a/a>");
    } else {
      _contentList.add("$_content"
          "\n");
    }

    LogUtil.v(
        "_buildMsgItem(_contentList.length)${_contentList.length},(_urlList.length)${_urlList.length}");
    if (_contentList.length >= _urlList.length) {
      List<String> _listTmp = List();
      _listTmp.addAll(_contentList);
      for (var i = 0; i < _urlList.length; i++) {
        LogUtil.v(
            "_buildMsgItem(_contentList.length)${_contentList.length}>=(_urlList.length)${_urlList.length}(i)$i");
        if (_contentList[i] != '') {
          _contentWidgetList.add(
            FSuper(
              text: _contentList[i],
              textAlign: TextAlign.left,
              textAlignment: Alignment.topLeft,
              textSize: AppSize.sp(30.0),
              fontHeight: 1.2,
            ),
          );
        }

        _listTmp.remove(_contentList[i]);
        _contentWidgetList.add(
          FSuper(
              text: _urlList[i],
              textAlign: TextAlign.left,
              textAlignment: Alignment.topLeft,
              textSize: AppSize.sp(28.0),
              fontHeight: 1.0,
              textColor: Colors.indigo,
              onClick: () {
                UrlLaunchUtils.launchURL(_urlList[i]);
              }),
        );
//      LogUtil.v(
//          "_buildMsgItem(_contentListTmp.length)${_contentListTmp.length}$_contentListTmp");
      }
      for (var item in _listTmp) {
        if (item != "") {
          _contentWidgetList.add(
            FSuper(
              text: item,
              textAlign: TextAlign.left,
              textAlignment: Alignment.topLeft,
              textSize: AppSize.sp(30.0),
              fontHeight: 1.0,
            ),
          );
        }
      }
    } else if (_contentList.length < _urlList.length) {
      List<String> _listTmp = List();
      _listTmp.addAll(_urlList);
//      var _listTmp = _urlList;
      for (var i = 0; i < _contentList.length; i++) {
        LogUtil.v(
            "_buildMsgItem(_contentList.length)${_contentList.length}<(_urlList.length)${_urlList.length}(i)$i");
//        LogUtil.v(
//            "_buildMsgItem(_contentList.length)${_contentList.length}(i)$i");
        _contentWidgetList.add(
          FSuper(
            text: _contentList[i],
            textAlign: TextAlign.left,
            textAlignment: Alignment.topLeft,
            textSize: AppSize.sp(30.0),
            fontHeight: 1.2,
          ),
        );
        _listTmp.remove(_urlList[i]);
        _contentWidgetList.add(
          FSuper(
            text: _urlList[i],
            textAlign: TextAlign.left,
            textAlignment: Alignment.topLeft,
            textSize: AppSize.sp(28.0),
            fontHeight: 1.0,
            textColor: Colors.indigo,
            onClick: () {
              UrlLaunchUtils.launchURL(_urlList[i]);
            },
          ),
        );
//      LogUtil.v(
//          "_buildMsgItem(_contentListTmp.length)${_contentListTmp.length}$_contentListTmp");
      }
      for (var item in _listTmp) {
        _contentWidgetList.add(
          FSuper(
            text: item,
            textAlign: TextAlign.left,
            textAlignment: Alignment.topLeft,
            textSize: AppSize.sp(30.0),
            fontHeight: 1.0,
            textColor: Colors.indigo,
            onClick: () {
              UrlLaunchUtils.launchURL(item);
            },
          ),
        );
      }
    }

    bool _hasImage = false;
//        (msgItem?.image.picURL != null && msgItem.image.picURL != '');
    if (msgItem != null &&
        msgItem.image != null &&
        msgItem.image.picURL != null &&
        msgItem.image.picURL != "") {
      _hasImage = true;
      LogUtil.v("(msgItem.image.picURL)${msgItem.image.picURL}");
    } else {
//      LogUtil.v("(msgItem.image.picURL)${msgItem.image.picURL}");
    }
    double _size = 0.0;
    if (_hasImage) {
//      LogUtil.v('_buildMsgItem(_hasImage):$_hasImage');
//      _size = AppSize.height(380.0);
      _size = 180.0;
    }
    return FSuper(
      spans: [
        TextSpan(children: <InlineSpan>[
          WidgetSpan(
              child: Wrap(
//                mainAxisSize: MainAxisSize.min,
            children: _contentWidgetList,
          )),
        ]),
        TextSpan(text: (_hasImage) ? '\n' : ''),
        TextSpan(
          children: <InlineSpan>[
            WidgetSpan(
              child: (!_hasImage)
                  ? Container()
                  : Image.network(
                      msgItem.image.picURL,
                      width: _size,
                      fit: BoxFit.fill,
                    ),
            ),
          ],
        ),
      ],
      textAlign: TextAlign.left,
      textAlignment: Alignment.centerLeft,
      fontHeight: 0.8,
      corner: Corner.all(6.0),
      margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0, bottom: 15.0),
      padding: EdgeInsets.fromLTRB((16.0 + 25.0 + 12), 8, (0.0 + 8.0), 8),
      strokeColor: Colors.grey,
      strokeWidth: 0.1,
//      backgroundColor: Color(0xffeeeeee).withOpacity(0.5),
      redPoint: false,
      redPointSize: 20,
      redPointColor: Colors.indigo,
      redPointText: "${DateTime.now().toString()}",
      onClick: () {
        Clipboard.setData(ClipboardData(text: '${msgItem.text.content}'));
        buildshowDialog(
            context,
            "以下内容已复制😊\n"
            "${msgItem.text.content}");
      },
      child1: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.3),
        backgroundImage: (_hasImage)
            ? NetworkImage('${msgItem.image.picURL}')
            : AssetImage('assets/images/bg/head$_headCount.jpg'),
      ),
      child1Alignment: Alignment.topLeft,
      child1Margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
      child2: Text(
        "${msgItem.msgTime ?? ''}",
        style: TextStyle(fontSize: AppSize.sp(20.0), color: Colors.grey),
      ),
      child2Alignment: Alignment.bottomRight,
      child2Margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    );
  }

}
