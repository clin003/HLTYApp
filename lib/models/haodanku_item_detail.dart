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

class HaodankuItemDetailRoot {
  HaodankuItemDetailRoot({
    this.code,
    this.min_id,
    this.msg,
    this.data,
  });

  factory HaodankuItemDetailRoot.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : HaodankuItemDetailRoot(
    code: asT<int>(jsonRes['code']),
    min_id: asT<int>(jsonRes['min_id']),
    msg: asT<String>(jsonRes['msg']),
    data: HaodankuItemDetailData.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])),
  );

  int code;
  int min_id;
  String msg;
  HaodankuItemDetailData data;

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

class HaodankuItemDetailData {
  HaodankuItemDetailData({
    this.product_id,
    this.itemid,
    this.seller_id,
    this.itemtitle,
    this.itemshorttitle,
    this.itemdesc,
    this.itemprice,
    this.itemsale,
    this.itemsale2,
    this.todaysale,
    this.itempic,
    this.itempic_copy,
    this.fqcat,
    this.itemendprice,
    this.shoptype,
    this.tktype,
    this.tkrates,
    this.cuntao,
    this.tkmoney,
    this.couponurl,
    this.couponmoney,
    this.couponsurplus,
    this.couponreceive,
    this.couponreceive2,
    this.todaycouponreceive,
    this.couponnum,
    this.couponexplain,
    this.couponstarttime,
    this.couponendtime,
    this.start_time,
    this.end_time,
    this.starttime,
    this.isquality,
    this.report_status,
    this.is_brand,
    this.is_live,
    this.guide_article,
    this.videoid,
    this.activity_type,
    this.general_index,
    this.planlink,
    this.seller_name,
    this.userid,
    this.sellernick,
    this.shopname,
    this.online_users,
    this.original_img,
    this.original_article,
    this.discount,
    this.is_explosion,
    this.me,
    this.activityid,
    this.coupon_condition,
    this.taobao_image,
    this.shopid,
    this.son_category,
    this.down_type,
    this.deposit,
    this.deposit_deduct,
    this.is_shipping,
    this.shop_score,
  });

  factory HaodankuItemDetailData.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : HaodankuItemDetailData(
    product_id: asT<String>(jsonRes['product_id']),
    itemid: asT<String>(jsonRes['itemid']),
    seller_id: asT<String>(jsonRes['seller_id']),
    itemtitle: asT<String>(jsonRes['itemtitle']),
    itemshorttitle: asT<String>(jsonRes['itemshorttitle']),
    itemdesc: asT<String>(jsonRes['itemdesc']),
    itemprice: asT<String>(jsonRes['itemprice']),
    itemsale: asT<String>(jsonRes['itemsale']),
    itemsale2: asT<String>(jsonRes['itemsale2']),
    todaysale: asT<String>(jsonRes['todaysale']),
    itempic: asT<String>(jsonRes['itempic']),
    itempic_copy: asT<String>(jsonRes['itempic_copy']),
    fqcat: asT<String>(jsonRes['fqcat']),
    itemendprice: asT<String>(jsonRes['itemendprice']),
    shoptype: asT<String>(jsonRes['shoptype']),
    tktype: asT<String>(jsonRes['tktype']),
    tkrates: asT<String>(jsonRes['tkrates']),
    cuntao: asT<String>(jsonRes['cuntao']),
    tkmoney: asT<String>(jsonRes['tkmoney']),
    couponurl: asT<String>(jsonRes['couponurl']),
    couponmoney: asT<String>(jsonRes['couponmoney']),
    couponsurplus: asT<String>(jsonRes['couponsurplus']),
    couponreceive: asT<String>(jsonRes['couponreceive']),
    couponreceive2: asT<String>(jsonRes['couponreceive2']),
    todaycouponreceive: asT<String>(jsonRes['todaycouponreceive']),
    couponnum: asT<String>(jsonRes['couponnum']),
    couponexplain: asT<String>(jsonRes['couponexplain']),
    couponstarttime: asT<String>(jsonRes['couponstarttime']),
    couponendtime: asT<String>(jsonRes['couponendtime']),
    start_time: asT<String>(jsonRes['start_time']),
    end_time: asT<String>(jsonRes['end_time']),
    starttime: asT<String>(jsonRes['starttime']),
    isquality: asT<String>(jsonRes['isquality']),
    report_status: asT<String>(jsonRes['report_status']),
    is_brand: asT<String>(jsonRes['is_brand']),
    is_live: asT<String>(jsonRes['is_live']),
    guide_article: asT<String>(jsonRes['guide_article']),
    videoid: asT<String>(jsonRes['videoid']),
    activity_type: asT<String>(jsonRes['activity_type']),
    general_index: asT<String>(jsonRes['general_index']),
    planlink: asT<Object>(jsonRes['planlink']),
    seller_name: asT<String>(jsonRes['seller_name']),
    userid: asT<String>(jsonRes['userid']),
    sellernick: asT<String>(jsonRes['sellernick']),
    shopname: asT<String>(jsonRes['shopname']),
    online_users: asT<String>(jsonRes['online_users']),
    original_img: asT<Object>(jsonRes['original_img']),
    original_article: asT<Object>(jsonRes['original_article']),
    discount: asT<String>(jsonRes['discount']),
    is_explosion: asT<String>(jsonRes['is_explosion']),
    me: asT<Object>(jsonRes['me']),
    activityid: asT<String>(jsonRes['activityid']),
    coupon_condition: asT<String>(jsonRes['coupon_condition']),
    taobao_image: asT<String>(jsonRes['taobao_image']),
    shopid: asT<String>(jsonRes['shopid']),
    son_category: asT<String>(jsonRes['son_category']),
    down_type: asT<String>(jsonRes['down_type']),
    deposit: asT<String>(jsonRes['deposit']),
    deposit_deduct: asT<String>(jsonRes['deposit_deduct']),
    is_shipping: asT<String>(jsonRes['is_shipping']),
    shop_score:  HaodankuItemDetailShop_score.fromJson(
        asT<Map<String, dynamic>>(jsonRes['shop_score'])),
  );

  String product_id;
  String itemid;
  String seller_id;
  String itemtitle;
  String itemshorttitle;
  String itemdesc;
  String itemprice;
  String itemsale;
  String itemsale2;
  String todaysale;
  String itempic;
  String itempic_copy;
  String fqcat;
  String itemendprice;
  String shoptype;
  String tktype;
  String tkrates;
  String cuntao;
  String tkmoney;
  String couponurl;
  String couponmoney;
  String couponsurplus;
  String couponreceive;
  String couponreceive2;
  String todaycouponreceive;
  String couponnum;
  String couponexplain;
  String couponstarttime;
  String couponendtime;
  String start_time;
  String end_time;
  String starttime;
  String isquality;
  String report_status;
  String is_brand;
  String is_live;
  String guide_article;
  String videoid;
  String activity_type;
  String general_index;
  Object planlink;
  String seller_name;
  String userid;
  String sellernick;
  String shopname;
  String online_users;
  Object original_img;
  Object original_article;
  String discount;
  String is_explosion;
  Object me;
  String activityid;
  String coupon_condition;
  String taobao_image;
  String shopid;
  String son_category;
  String down_type;
  String deposit;
  String deposit_deduct;
  String is_shipping;
  HaodankuItemDetailShop_score shop_score;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'product_id': product_id,
    'itemid': itemid,
    'seller_id': seller_id,
    'itemtitle': itemtitle,
    'itemshorttitle': itemshorttitle,
    'itemdesc': itemdesc,
    'itemprice': itemprice,
    'itemsale': itemsale,
    'itemsale2': itemsale2,
    'todaysale': todaysale,
    'itempic': itempic,
    'itempic_copy': itempic_copy,
    'fqcat': fqcat,
    'itemendprice': itemendprice,
    'shoptype': shoptype,
    'tktype': tktype,
    'tkrates': tkrates,
    'cuntao': cuntao,
    'tkmoney': tkmoney,
    'couponurl': couponurl,
    'couponmoney': couponmoney,
    'couponsurplus': couponsurplus,
    'couponreceive': couponreceive,
    'couponreceive2': couponreceive2,
    'todaycouponreceive': todaycouponreceive,
    'couponnum': couponnum,
    'couponexplain': couponexplain,
    'couponstarttime': couponstarttime,
    'couponendtime': couponendtime,
    'start_time': start_time,
    'end_time': end_time,
    'starttime': starttime,
    'isquality': isquality,
    'report_status': report_status,
    'is_brand': is_brand,
    'is_live': is_live,
    'guide_article': guide_article,
    'videoid': videoid,
    'activity_type': activity_type,
    'general_index': general_index,
    'planlink': planlink,
    'seller_name': seller_name,
    'userid': userid,
    'sellernick': sellernick,
    'shopname': shopname,
    'online_users': online_users,
    'original_img': original_img,
    'original_article': original_article,
    'discount': discount,
    'is_explosion': is_explosion,
    'me': me,
    'activityid': activityid,
    'coupon_condition': coupon_condition,
    'taobao_image': taobao_image,
    'shopid': shopid,
    'son_category': son_category,
    'down_type': down_type,
    'deposit': deposit,
    'deposit_deduct': deposit_deduct,
    'is_shipping': is_shipping,
    'shop_score': shop_score,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class HaodankuItemDetailShop_score {
  HaodankuItemDetailShop_score({
    this.desc_score,
    this.desc_level,
    this.serv_score,
    this.serv_level,
    this.post_score,
    this.post_level,
  });

  factory  HaodankuItemDetailShop_score.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      :  HaodankuItemDetailShop_score(
    desc_score: asT<double>(jsonRes['desc_score']),
    desc_level: asT<int>(jsonRes['desc_level']),
    serv_score: asT<double>(jsonRes['serv_score']),
    serv_level: asT<int>(jsonRes['serv_level']),
    post_score: asT<double>(jsonRes['post_score']),
    post_level: asT<int>(jsonRes['post_level']),
  );

  double desc_score;
  int desc_level;
  double serv_score;
  int serv_level;
  double post_score;
  int post_level;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'desc_score': desc_score,
    'desc_level': desc_level,
    'serv_score': serv_score,
    'serv_level': serv_level,
    'post_score': post_score,
    'post_level': post_level,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
