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

class MaterialIdList {
  MaterialIdList({
    this.materialIdList,
  });

  factory MaterialIdList.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<MaterialIdList> materialIdList =
    jsonRes['materialIdList'] is List ? <MaterialIdList>[] : null;
    if (materialIdList != null) {
      for (final dynamic item in jsonRes['materialIdList']) {
        if (item != null) {
          materialIdList
              .add(MaterialIdList.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return MaterialIdList(
      materialIdList: materialIdList,
    );
  }

  List<MaterialIdList> materialIdList;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'materialIdList': materialIdList,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class MaterialIdItem{
  MaterialIdItem({
    this.catName,
    this.id,
    this.name,
    this.totalResults,
  });

  factory MaterialIdItem.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : MaterialIdItem(
        catName: asT<String>(jsonRes['catName']),
        id: asT<String>(jsonRes['id']),
        name: asT<String>(jsonRes['name']),
        totalResults: asT<int>(jsonRes['totalResults']),
      );

  String catName;
  String id;
  String name;
  int totalResults;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'catName': catName,
    'id': id,
    'name': name,
    'totalResults': totalResults,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
