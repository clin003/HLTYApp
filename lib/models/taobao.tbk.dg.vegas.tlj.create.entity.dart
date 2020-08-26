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

class TbkDgVegasTljCreateResponse {
  TbkDgVegasTljCreateResponse({
    this.request_id,
    this.result,
  });

  factory TbkDgVegasTljCreateResponse.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TbkDgVegasTljCreateResponse(
    request_id: asT<String>(jsonRes['request_id']),
    result: TbkDgVegasTljCreateResponseResult.fromJson(asT<Map<String, dynamic>>(jsonRes['result'])),
  );

  String request_id;
  TbkDgVegasTljCreateResponseResult result;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'request_id': request_id,
    'result': result,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class TbkDgVegasTljCreateResponseResult {
  TbkDgVegasTljCreateResponseResult({
    this.model,
    this.success,
  });

  factory TbkDgVegasTljCreateResponseResult.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TbkDgVegasTljCreateResponseResult(
    model: TbkDgVegasTljCreateResponseModel.fromJson(asT<Map<String, dynamic>>(jsonRes['model'])),
    success: asT<bool>(jsonRes['success']),
  );

  TbkDgVegasTljCreateResponseModel model;
  bool success;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'model': model,
    'success': success,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class TbkDgVegasTljCreateResponseModel {
  TbkDgVegasTljCreateResponseModel({
    this.rights_id,
    this.send_url,
    this.vegas_code,
  });

  factory TbkDgVegasTljCreateResponseModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TbkDgVegasTljCreateResponseModel(
    rights_id: asT<String>(jsonRes['rights_id']),
    send_url: asT<String>(jsonRes['send_url']),
    vegas_code: asT<String>(jsonRes['vegas_code']),
  );

  String rights_id;
  String send_url;
  String vegas_code;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rights_id': rights_id,
    'send_url': send_url,
    'vegas_code': vegas_code,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
