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

class TaobaoTopErrorResponse {
  TaobaoTopErrorResponse({
    this.request_id,
    this.result,
  });

  factory TaobaoTopErrorResponse.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TaobaoTopErrorResponse(
    request_id: asT<String>(jsonRes['request_id']),
    result: TaobaoTopErrorResponseResult.fromJson(asT<Map<String, dynamic>>(jsonRes['result'])),
  );

  String request_id;
  TaobaoTopErrorResponseResult result;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'request_id': request_id,
    'result': result,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class TaobaoTopErrorResponseResult {
  TaobaoTopErrorResponseResult({
    this.msg_code,
    this.msg_info,
    this.success,
  });

  factory TaobaoTopErrorResponseResult.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TaobaoTopErrorResponseResult(
    msg_code: asT<String>(jsonRes['msg_code']),
    msg_info: asT<String>(jsonRes['msg_info']),
    success: asT<bool>(jsonRes['success']),
  );

  String msg_code;
  String msg_info;
  bool success;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'msg_code': msg_code,
    'msg_info': msg_info,
    'success': success,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
