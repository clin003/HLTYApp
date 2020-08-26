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

class APPIndexRoot {
  APPIndexRoot({
    this.bannerList,
    this.hotBannerList,
    this.iconList,
    this.brandDTOS,
    this.findProductMaterial,
    this.guessProductList,
    this.banChickUrl,
  });

  factory APPIndexRoot.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<BannerList> bannerList =
    jsonRes['bannerList'] is List ? <BannerList>[] : null;
    if (bannerList != null) {
      for (final dynamic item in jsonRes['bannerList']) {
        if (item != null) {
          bannerList.add(BannerList.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }

    final List<HotBannerList> hotBannerList =
    jsonRes['hotBannerList'] is List ? <HotBannerList>[] : null;
    if (hotBannerList != null) {
      for (final dynamic item in jsonRes['hotBannerList']) {
        if (item != null) {
          hotBannerList
              .add(HotBannerList.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }

    final List<IconList> iconList =
    jsonRes['iconList'] is List ? <IconList>[] : null;
    if (iconList != null) {
      for (final dynamic item in jsonRes['iconList']) {
        if (item != null) {
          iconList.add(IconList.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }

    final List<BrandDTOS> brandDTOS =
    jsonRes['brandDTOS'] is List ? <BrandDTOS>[] : null;
    if (brandDTOS != null) {
      for (final dynamic item in jsonRes['brandDTOS']) {
        if (item != null) {
          brandDTOS.add(BrandDTOS.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return APPIndexRoot(
      bannerList: bannerList,
      hotBannerList: hotBannerList,
      iconList: iconList,
      brandDTOS: brandDTOS,
      findProductMaterial: FindProductMaterial.fromJson(
          asT<Map<String, dynamic>>(jsonRes['findProductMaterial'])),
      guessProductList: GuessProductList.fromJson(
          asT<Map<String, dynamic>>(jsonRes['guessProductList'])),
      banChickUrl: asT<bool>(jsonRes['banChickUrl']),
    );
  }

  List<BannerList> bannerList;
  List<HotBannerList> hotBannerList;
  List<IconList> iconList;
  List<BrandDTOS> brandDTOS;
  FindProductMaterial findProductMaterial;
  GuessProductList guessProductList;
  bool banChickUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'bannerList': bannerList,
    'hotBannerList': hotBannerList,
    'iconList': iconList,
    'brandDTOS': brandDTOS,
    'findProductMaterial': findProductMaterial,
    'guessProductList': guessProductList,
    'banChickUrl': banChickUrl,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class BannerList {
  BannerList({
    this.eventEnName,
    this.eventId,
    this.eventName,
    this.pageId,
    this.pageSourceBu,
    this.name,
    this.pictUrl,
    this.moreUrl,
    this.urlScheme,
    this.startTime,
    this.endTime,
  });

  factory BannerList.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : BannerList(
    eventEnName: asT<String>(jsonRes['eventEnName']),
    eventId: asT<String>(jsonRes['eventId']),
    eventName: asT<String>(jsonRes['eventName']),
    pageId: asT<String>(jsonRes['pageId']),
    pageSourceBu: asT<String>(jsonRes['pageSourceBu']),
    name: asT<String>(jsonRes['name']),
    pictUrl: asT<String>(jsonRes['pictUrl']),
    moreUrl: asT<String>(jsonRes['moreUrl']),
    urlScheme: asT<String>(jsonRes['urlScheme']),
    startTime: asT<String>(jsonRes['startTime']),
    endTime: asT<String>(jsonRes['endTime']),
  );

  String eventEnName;
  String eventId;
  String eventName;
  String pageId;
  String pageSourceBu;
  String name;
  String pictUrl;
  String moreUrl;
  String urlScheme;
  String startTime;
  String endTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'eventEnName': eventEnName,
    'eventId': eventId,
    'eventName': eventName,
    'pageId': pageId,
    'pageSourceBu': pageSourceBu,
    'name': name,
    'pictUrl': pictUrl,
    'moreUrl': moreUrl,
    'urlScheme': urlScheme,
    'startTime': startTime,
    'endTime': endTime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class HotBannerList {
  HotBannerList({
    this.name,
    this.pictUrl,
    this.moreUrl,
    this.urlScheme,
    this.startTime,
    this.endTime,
  });

  factory HotBannerList.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : HotBannerList(
        name: asT<String>(jsonRes['name']),
        pictUrl: asT<String>(jsonRes['pictUrl']),
        moreUrl: asT<String>(jsonRes['moreUrl']),
        urlScheme: asT<String>(jsonRes['urlScheme']),
        startTime: asT<String>(jsonRes['startTime']),
        endTime: asT<String>(jsonRes['endTime']),
      );

  String name;
  String pictUrl;
  String moreUrl;
  String urlScheme;
  String startTime;
  String endTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'pictUrl': pictUrl,
    'moreUrl': moreUrl,
    'urlScheme': urlScheme,
    'startTime': startTime,
    'endTime': endTime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class IconList {
  IconList({
    this.name,
    this.pictUrl,
    this.moreUrl,
    this.urlScheme,
    this.startTime,
    this.endTime,
  });

  factory IconList.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : IconList(
    name: asT<String>(jsonRes['name']),
    pictUrl: asT<String>(jsonRes['pictUrl']),
    moreUrl: asT<String>(jsonRes['moreUrl']),
    urlScheme: asT<String>(jsonRes['urlScheme']),
    startTime: asT<String>(jsonRes['startTime']),
    endTime: asT<String>(jsonRes['endTime']),
  );

  String name;
  String pictUrl;
  String moreUrl;
  String urlScheme;
  String startTime;
  String endTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'pictUrl': pictUrl,
    'moreUrl': moreUrl,
    'urlScheme': urlScheme,
    'startTime': startTime,
    'endTime': endTime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class BrandDTOS {
  BrandDTOS({
    this.backgroundImg,
    this.brandId,
    this.brandLogo,
    this.brandName,
    this.brandLabelOne,
    this.hotPush,
    this.jumpType,
    this.label,
    this.name,
    this.pictUrl,
    this.moreUrl,
    this.urlScheme,
    this.startTime,
    this.endTime,
  });

  factory BrandDTOS.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : BrandDTOS(
    backgroundImg: asT<String>(jsonRes['backgroundImg']),
    brandId: asT<String>(jsonRes['brandId']),
    brandLogo: asT<String>(jsonRes['brandLogo']),
    brandName: asT<String>(jsonRes['brandName']),
    brandLabelOne: asT<String>(jsonRes['brandLabelOne']),
    hotPush: asT<String>(jsonRes['hotPush']),
    jumpType: asT<String>(jsonRes['jumpType']),
    label: asT<String>(jsonRes['label']),
    name: asT<String>(jsonRes['name']),
    pictUrl: asT<String>(jsonRes['pictUrl']),
    moreUrl: asT<String>(jsonRes['moreUrl']),
    urlScheme: asT<String>(jsonRes['urlScheme']),
    startTime: asT<String>(jsonRes['startTime']),
    endTime: asT<String>(jsonRes['endTime']),
  );

  String backgroundImg;
  String brandId;
  String brandLogo;
  String brandName;
  String brandLabelOne;
  String hotPush;
  String jumpType;
  String label;
  String name;
  String pictUrl;
  String moreUrl;
  String urlScheme;
  String startTime;
  String endTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'backgroundImg': backgroundImg,
    'brandId': brandId,
    'brandLogo': brandLogo,
    'brandName': brandName,
    'brandLabelOne': brandLabelOne,
    'hotPush': hotPush,
    'jumpType': jumpType,
    'label': label,
    'name': name,
    'pictUrl': pictUrl,
    'moreUrl': moreUrl,
    'urlScheme': urlScheme,
    'startTime': startTime,
    'endTime': endTime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class FindProductMaterial {
  FindProductMaterial({
    this.catName,
    this.id,
    this.name,
    this.totalResults,
  });

  factory FindProductMaterial.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : FindProductMaterial(
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

class GuessProductList {
  GuessProductList({
    this.catName,
    this.id,
    this.name,
    this.totalResults,
  });

  factory GuessProductList.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : GuessProductList(
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
