//class WebviewDataModel {
//  String title;
//  String url;
//
//
//  WebviewDataModel({this.title,this.url});
//}


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

class WebviewDataModel {
  WebviewDataModel({
    this.title,
    this.url,
  });

  factory WebviewDataModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : WebviewDataModel(
    title: asT<String>(jsonRes['title']),
    url: asT<String>(jsonRes['url']),
  );

  String title;
  String url;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'url': url,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
