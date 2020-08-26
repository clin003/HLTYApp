import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  if (value != null) {
    final String valueS = value.toString();
    if (0 is T) {
      return int.tryParse(valueS) as T;
    } else if (0.0 is T) {
      return double.tryParse(valueS) as T;
    } else if ('' is T) {
      return valueS as T;
    } else if (false is T) {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return bool.fromEnvironment(value.toString()) as T;
    }
  }
  return null;
}

class HaodankuHotKeyRoot {
  HaodankuHotKeyRoot({
    this.code,
    this.min_id,
    this.msg,
    this.data,
  });

  factory HaodankuHotKeyRoot.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<HaodankuHotKeyData> data = jsonRes['data'] is List ? <HaodankuHotKeyData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']) {
        if (item != null) {
          data.add(HaodankuHotKeyData.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return HaodankuHotKeyRoot(
      code: asT<int>(jsonRes['code']),
      min_id: asT<int>(jsonRes['min_id']),
      msg: asT<String>(jsonRes['msg']),
      data: data,
    );
  }

  int code;
  int min_id;
  String msg;
  List<HaodankuHotKeyData> data;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    'min_id': min_id,
    'msg': msg,
    'data': data,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class HaodankuHotKeyData {
  HaodankuHotKeyData({
    this.keyword,
  });

  factory HaodankuHotKeyData.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : HaodankuHotKeyData(
    keyword: asT<String>(jsonRes['keyword']),
  );

  String keyword;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'keyword': keyword,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
