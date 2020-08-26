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

class AppVersionInfo {
  AppVersionInfo({
    this.title,
    this.contents,
    this.apkDownloadUrl,
    this.force,
    this.version,
  });

  factory AppVersionInfo.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<String> contents =
    jsonRes['contents'] is List ? <String>[] : null;
    if (contents != null) {
      for (final dynamic item in jsonRes['contents']) {
        if (item != null) {
          contents.add(asT<String>(item));
        }
      }
    }
    return AppVersionInfo(
      title: asT<String>(jsonRes['title']),
      contents: contents,
      apkDownloadUrl: asT<String>(jsonRes['apkDownloadUrl']),
      force: asT<bool>(jsonRes['force']),
      version: asT<String>(jsonRes['version']),
    );
  }

  String title;
  List<String> contents;
  String apkDownloadUrl;
  bool force;
  String version;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'contents': contents,
    'apkDownloadUrl': apkDownloadUrl,
    'force': force,
    'version': version,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
