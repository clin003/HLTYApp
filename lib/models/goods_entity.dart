//import 'dart:convert' show json;
//
//T asT<T>(dynamic value) {
//  if (value is T) {
//    return value;
//  }
//  if (value != null) {
//    final String valueS = value.toString();
//    if (0 is T) {
//      return int.tryParse(valueS) as T;
//    } else if (0.0 is T) {
//      return double.tryParse(valueS) as T;
//    } else if ('' is T) {
//      return valueS as T;
//    } else if (false is T) {
//      if (valueS == '0' || valueS == '1') {
//        return (valueS == '1') as T;
//      }
//      return bool.fromEnvironment(value.toString()) as T;
//    }
//  }
//  return null;
//}
//
//class GoodsModel {
//  GoodsModel({
//    this.id,
//    this.apiType,
//    this.goodsId,
//    this.goodsIntroduce,
//    this.goodsPic,
//    this.goodsPicEx,
//    this.goodsPrice,
//    this.goodsSales,
//    this.goodsSrc,
//    this.goodsTime,
//    this.goodsTitle,
//    this.goodsTitleS,
//    this.goodsUrl,
//    this.quanCondition,
//    this.quanEndPrice,
//    this.quanId,
//    this.quanMoney,
//    this.quanNum,
//    this.quanStartFee,
//    this.quanSurplus,
//    this.quanTime,
//    this.reportStatus,
//    this.sellerID,
//    this.shopType,
//    this.tbkClickUrl,
//    this.tbkClickUrlTaoKouLing,
//    this.tbkCommission,
//    this.tbkPlanUrl,
//    this.tbkType,
//    this.videoID,
//    this.videoUrl,
//  });
//
//  factory GoodsModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
//      ? null
//      : GoodsModel(
//          id: asT<int>(jsonRes['id']),
//          apiType: asT<String>(jsonRes['apiType']),
//          goodsId: asT<String>(jsonRes['goodsId']),
//          goodsIntroduce: asT<String>(jsonRes['goodsIntroduce']),
//          goodsPic: asT<String>(jsonRes['goodsPic']),
//          goodsPicEx: asT<String>(jsonRes['goodsPicEx']),
//          goodsPrice: asT<double>(jsonRes['goodsPrice']),
//          goodsSales: asT<int>(jsonRes['goodsSales']),
//          goodsSrc: asT<String>(jsonRes['goodsSrc']),
//          goodsTime: asT<int>(jsonRes['goodsTime']),
//          goodsTitle: asT<String>(jsonRes['goodsTitle']),
//          goodsTitleS: asT<String>(jsonRes['goodsTitleS']),
//          goodsUrl: asT<String>(jsonRes['goodsUrl']),
//          quanCondition: asT<String>(jsonRes['quanCondition']),
//          quanEndPrice: asT<double>(jsonRes['quanEndPrice']),
//          quanId: asT<String>(jsonRes['quanId']),
//          quanMoney: asT<int>(jsonRes['quanMoney']),
//          quanNum: asT<int>(jsonRes['quanNum']),
//          quanStartFee: asT<int>(jsonRes['quanStartFee']),
//          quanSurplus: asT<int>(jsonRes['quanSurplus']),
//          quanTime: asT<int>(jsonRes['quanTime']),
//          reportStatus: asT<int>(jsonRes['reportStatus']),
//          sellerID: asT<String>(jsonRes['sellerID']),
//          shopType: asT<String>(jsonRes['shopType']),
//          tbkClickUrl: asT<String>(jsonRes['tbkClickUrl']),
//          tbkClickUrlTaoKouLing: asT<String>(jsonRes['tbkClickUrlTaoKouLing']),
//          tbkCommission: asT<int>(jsonRes['tbkCommission']),
//          tbkPlanUrl: asT<String>(jsonRes['tbkPlanUrl']),
//          tbkType: asT<String>(jsonRes['tbkType']),
//          videoID: asT<String>(jsonRes['videoID']),
//          videoUrl: asT<String>(jsonRes['videoUrl']),
//        );
//
//  int id;
//  String apiType;
//  String goodsId;
//  String goodsIntroduce;
//  String goodsPic;
//  String goodsPicEx;
//  double goodsPrice;
//  int goodsSales;
//  String goodsSrc;
//  int goodsTime;
//  String goodsTitle;
//  String goodsTitleS;
//  String goodsUrl;
//  String quanCondition;
//  double quanEndPrice;
//  String quanId;
//  int quanMoney;
//  int quanNum;
//  int quanStartFee;
//  int quanSurplus;
//  int quanTime;
//  int reportStatus;
//  String sellerID;
//  String shopType;
//  String tbkClickUrl;
//  String tbkClickUrlTaoKouLing;
//  int tbkCommission;
//  String tbkPlanUrl;
//  String tbkType;
//  String videoID;
//  String videoUrl;
//
//  Map<String, dynamic> toJson() => <String, dynamic>{
//        'id': id,
//        'apiType': apiType,
//        'goodsId': goodsId,
//        'goodsIntroduce': goodsIntroduce,
//        'goodsPic': goodsPic,
//        'goodsPicEx': goodsPicEx,
//        'goodsPrice': goodsPrice,
//        'goodsSales': goodsSales,
//        'goodsSrc': goodsSrc,
//        'goodsTime': goodsTime,
//        'goodsTitle': goodsTitle,
//        'goodsTitleS': goodsTitleS,
//        'goodsUrl': goodsUrl,
//        'quanCondition': quanCondition,
//        'quanEndPrice': quanEndPrice,
//        'quanId': quanId,
//        'quanMoney': quanMoney,
//        'quanNum': quanNum,
//        'quanStartFee': quanStartFee,
//        'quanSurplus': quanSurplus,
//        'quanTime': quanTime,
//        'reportStatus': reportStatus,
//        'sellerID': sellerID,
//        'shopType': shopType,
//        'tbkClickUrl': tbkClickUrl,
//        'tbkClickUrlTaoKouLing': tbkClickUrlTaoKouLing,
//        'tbkCommission': tbkCommission,
//        'tbkPlanUrl': tbkPlanUrl,
//        'tbkType': tbkType,
//        'videoID': videoID,
//        'videoUrl': videoUrl,
//      };
//  @override
//  String toString() {
//    return json.encode(this);
//  }
//}
