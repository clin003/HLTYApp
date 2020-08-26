import 'dart:convert' show json;
import 'goods.dart';

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

class MaterialGoodsListModel {
  MaterialGoodsListModel({
    this.code,
    this.message,
    this.data,
  });

  factory MaterialGoodsListModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<GoodsItem> data = jsonRes['data'] is List ? <GoodsItem>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']) {
        if (item != null) {
          data.add(GoodsItem.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return MaterialGoodsListModel(
      code: asT<int>(jsonRes['code']),
      message: asT<String>(jsonRes['message']),
      data: data,
    );
  }

  int code;
  String message;
  List<GoodsItem> data;

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

