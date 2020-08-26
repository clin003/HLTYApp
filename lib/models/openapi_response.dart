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

class OpenAPIResponseModel {
  OpenAPIResponseModel({
    this.code,
    this.message,
    this.data,
  });

  factory OpenAPIResponseModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : OpenAPIResponseModel(
    code: asT<int>(jsonRes['code']),
    message: asT<String>(jsonRes['message']),
    data: asT<String>(jsonRes['data']),
  );

  int code;
  String message;
  String data;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    'message': message,
    'data': data,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
