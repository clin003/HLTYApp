import 'package:app/application.dart';
import 'package:app/conf/app_config.dart';
import 'package:app/utils/log_util.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketOpenAPI {
  static final String botToken =
      Application.sp.getString('hlty_token') ?? 'abc';
  static final String baseUrl = AppConfig().wsAPIbaseUrl;
  static final String apiURL = '$baseUrl/ws/live/abc';

  static WebSocketChannel channel() {
    String _apiURL = apiURL;
    String _appAPIbaseUrl = Application.getAppOpenAPIbaseUrl();
    if (_appAPIbaseUrl != null && _appAPIbaseUrl != '') {
      _apiURL = '$_appAPIbaseUrl/ws/live/$botToken';
    }
    if (_apiURL.startsWith("https:")) {
      _apiURL = _apiURL.replaceFirst('https:', 'wss:');
    } else {
      _apiURL = _apiURL.replaceFirst('http:', 'ws:');
    }
    LogUtil.v("WebSocketOpenAPI>channel(_apiURL)$_apiURL");
//    return IOWebSocketChannel.connect('wss://beta.lyhuilin.com/ws/live/abc');
    return IOWebSocketChannel.connect('$_apiURL');
  }
}
