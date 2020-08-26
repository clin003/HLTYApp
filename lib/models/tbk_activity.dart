class TbkActivity {
  int _code;
  String _message;
  List<TbkActivityData> _data;

  TbkActivity({int code, String message, List<TbkActivityData> data}) {
    this._code = code;
    this._message = message;
    this._data = data;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;
  List<TbkActivityData> get data => _data;
  set data(List<TbkActivityData> data) => _data = data;

  TbkActivity.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = new List<TbkActivityData>();
      json['data'].forEach((v) {
        _data.add(new TbkActivityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TbkActivityData {
  int _id;
  num _avgCommissionRate;
  String _pageName;
  String _activityId;
  String _bannerUrl;
  String _pageUrl;
  String _pageUrlKouLing;
  String _platformName;
  String _platformType;
  String _startTime;
  String _endTime;
  String _urlScheme;

  TbkActivityData(
      {int id,
      num avgCommissionRate,
      String pageName,
      String activityId,
      String bannerUrl,
      String pageUrl,
      String pageUrlKouLing,
      String platformName,
      String platformType,
      String startTime,
      String endTime,
      String urlScheme}) {
    this._id = id;
    this._avgCommissionRate = avgCommissionRate;
    this._pageName = pageName;
    this._activityId = activityId;
    this._bannerUrl = bannerUrl;
    this._pageUrl = pageUrl;
    this._pageUrlKouLing = pageUrlKouLing;
    this._platformName = platformName;
    this._platformType = platformType;
    this._startTime = startTime;
    this._endTime = endTime;
    this._urlScheme = urlScheme;
  }

  int get id => _id;
  set id(int id) => _id = id;
  num get avgCommissionRate => _avgCommissionRate;
  set avgCommissionRate(num avgCommissionRate) =>
      _avgCommissionRate = avgCommissionRate;
  String get pageName => _pageName;
  set pageName(String pageName) => _pageName = pageName;
  String get activityId => _activityId;
  set activityId(String activityId) => _activityId = activityId;
  String get bannerUrl => _bannerUrl;
  set bannerUrl(String bannerUrl) => _bannerUrl = bannerUrl;
  String get pageUrl => _pageUrl;
  set pageUrl(String pageUrl) => _pageUrl = pageUrl;
  String get pageUrlKouLing => _pageUrlKouLing;
  set pageUrlKouLing(String pageUrlKouLing) => _pageUrlKouLing = pageUrlKouLing;
  String get platformName => _platformName;
  set platformName(String platformName) => _platformName = platformName;
  String get platformType => _platformType;
  set platformType(String platformType) => _platformType = platformType;
  String get startTime => _startTime;
  set startTime(String startTime) => _startTime = startTime;
  String get endTime => _endTime;
  set endTime(String endTime) => _endTime = endTime;
  String get urlScheme => _urlScheme;
  set urlScheme(String urlScheme) => _urlScheme = urlScheme;

  TbkActivityData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _avgCommissionRate = json['avgCommissionRate'];
    _pageName = json['pageName'];
    _activityId = json['activityId'];
    _bannerUrl = json['bannerUrl'];
    _pageUrl = json['pageUrl'];
    _pageUrlKouLing = json['pageUrlKouLing'];
    _platformName = json['platformName'];
    _platformType = json['platformType'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _urlScheme = json['urlScheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['avgCommissionRate'] = this._avgCommissionRate;
    data['pageName'] = this._pageName;
    data['activityId'] = this._activityId;
    data['bannerUrl'] = this._bannerUrl;
    data['pageUrl'] = this._pageUrl;
    data['pageUrlKouLing'] = this._pageUrlKouLing;
    data['platformName'] = this._platformName;
    data['platformType'] = this._platformType;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    data['urlScheme'] = this._urlScheme;
    return data;
  }
}