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

class TbkDgMaterialOptionalModelRoot {
  TbkDgMaterialOptionalModelRoot({
    this.tbk_dg_material_optional_response,
  });

  factory TbkDgMaterialOptionalModelRoot.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TbkDgMaterialOptionalModelRoot(
    tbk_dg_material_optional_response:
    Tbk_dg_material_optional_response.fromJson(
        asT<Map<String, dynamic>>(
            jsonRes['tbk_dg_material_optional_response'])),
  );

  Tbk_dg_material_optional_response tbk_dg_material_optional_response;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'tbk_dg_material_optional_response': tbk_dg_material_optional_response,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Tbk_dg_material_optional_response {
  Tbk_dg_material_optional_response({
    this.request_id,
    this.result_list,
    this.total_results,
  });

  factory Tbk_dg_material_optional_response.fromJson(
      Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : Tbk_dg_material_optional_response(
        request_id: asT<String>(jsonRes['request_id']),
        result_list: Result_list.fromJson(
            asT<Map<String, dynamic>>(jsonRes['result_list'])),
        total_results: asT<int>(jsonRes['total_results']),
      );

  String request_id;
  Result_list result_list;
  int total_results;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'request_id': request_id,
    'result_list': result_list,
    'total_results': total_results,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Result_list {
  Result_list({
    this.map_data,
  });

  factory Result_list.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<Map_data> map_data =
    jsonRes['map_data'] is List ? <Map_data>[] : null;
    if (map_data != null) {
      for (final dynamic item in jsonRes['map_data']) {
        if (item != null) {
          map_data.add(Map_data.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return Result_list(
      map_data: map_data,
    );
  }

  List<Map_data> map_data;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'map_data': map_data,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Map_data {
  Map_data({
    this.category_id,
    this.category_name,
    this.commission_rate,
    this.commission_type,
    this.coupon_amount,
    this.coupon_end_time,
    this.coupon_id,
    this.coupon_info,
    this.coupon_remain_count,
    this.coupon_share_url,
    this.coupon_start_fee,
    this.coupon_start_time,
    this.coupon_total_count,
    this.include_dxjh,
    this.include_mkt,
    this.info_dxjh,
    this.item_description,
    this.item_id,
    this.item_url,
    this.level_one_category_id,
    this.level_one_category_name,
    this.nick,
    this.num_iid,
    this.pict_url,
    this.provcity,
    this.real_post_fee,
    this.reserve_price,
    this.seller_id,
    this.shop_dsr,
    this.shop_title,
    this.short_title,
    this.small_images,
    this.title,
    this.tk_total_commi,
    this.tk_total_sales,
    this.url,
    this.user_type,
    this.volume,
    this.white_image,
    this.x_id,
    this.zk_final_price,
    this.kuadian_promotion_info,
    this.sale_price,
    this.tmall_play_activity_info,
  });

  factory Map_data.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Map_data(
    category_id: asT<int>(jsonRes['category_id']),
    category_name: asT<String>(jsonRes['category_name']),
    commission_rate: asT<String>(jsonRes['commission_rate']),
    commission_type: asT<String>(jsonRes['commission_type']),
    coupon_amount: asT<String>(jsonRes['coupon_amount']),
    coupon_end_time: asT<String>(jsonRes['coupon_end_time']),
    coupon_id: asT<String>(jsonRes['coupon_id']),
    coupon_info: asT<String>(jsonRes['coupon_info']),
    coupon_remain_count: asT<int>(jsonRes['coupon_remain_count']),
    coupon_share_url: asT<String>(jsonRes['coupon_share_url']),
    coupon_start_fee: asT<String>(jsonRes['coupon_start_fee']),
    coupon_start_time: asT<String>(jsonRes['coupon_start_time']),
    coupon_total_count: asT<int>(jsonRes['coupon_total_count']),
    include_dxjh: asT<String>(jsonRes['include_dxjh']),
    include_mkt: asT<String>(jsonRes['include_mkt']),
    info_dxjh: asT<String>(jsonRes['info_dxjh']),
    item_description: asT<String>(jsonRes['item_description']),
    item_id: asT<int>(jsonRes['item_id']),
    item_url: asT<String>(jsonRes['item_url']),
    level_one_category_id: asT<int>(jsonRes['level_one_category_id']),
    level_one_category_name:
    asT<String>(jsonRes['level_one_category_name']),
    nick: asT<String>(jsonRes['nick']),
    num_iid: asT<int>(jsonRes['num_iid']),
    pict_url: asT<String>(jsonRes['pict_url']),
    provcity: asT<String>(jsonRes['provcity']),
    real_post_fee: asT<String>(jsonRes['real_post_fee']),
    reserve_price: asT<String>(jsonRes['reserve_price']),
    seller_id: asT<int>(jsonRes['seller_id']),
    shop_dsr: asT<int>(jsonRes['shop_dsr']),
    shop_title: asT<String>(jsonRes['shop_title']),
    short_title: asT<String>(jsonRes['short_title']),
    small_images: Small_images.fromJson(
        asT<Map<String, dynamic>>(jsonRes['small_images'])),
    title: asT<String>(jsonRes['title']),
    tk_total_commi: asT<String>(jsonRes['tk_total_commi']),
    tk_total_sales: asT<String>(jsonRes['tk_total_sales']),
    url: asT<String>(jsonRes['url']),
    user_type: asT<int>(jsonRes['user_type']),
    volume: asT<int>(jsonRes['volume']),
    white_image: asT<String>(jsonRes['white_image']),
    x_id: asT<String>(jsonRes['x_id']),
    zk_final_price: asT<String>(jsonRes['zk_final_price']),
      kuadian_promotion_info:  asT<String>(jsonRes['kuadian_promotion_info']),
      sale_price:asT<String>(jsonRes['sale_price']),
      tmall_play_activity_info:asT<String>(jsonRes['tmall_play_activity_info']),
  );

  int category_id;
  String category_name;
  String commission_rate;
  String commission_type;
  String coupon_amount;
  String coupon_end_time;
  String coupon_id;
  String coupon_info;
  int coupon_remain_count;
  String coupon_share_url;
  String coupon_start_fee;
  String coupon_start_time;
  int coupon_total_count;
  String include_dxjh;
  String include_mkt;
  String info_dxjh;
  String item_description;
  int item_id;
  String item_url;
  int level_one_category_id;
  String level_one_category_name;
  String nick;
  int num_iid;
  String pict_url;
  String provcity;
  String real_post_fee;
  String reserve_price;
  int seller_id;
  int shop_dsr;
  String shop_title;
  String short_title;
  Small_images small_images;
  String title;
  String tk_total_commi;
  String tk_total_sales;
  String url;
  int user_type;
  int volume;
  String white_image;
  String x_id;
  String zk_final_price;
  String kuadian_promotion_info;
  String sale_price;
  String tmall_play_activity_info;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'category_id': category_id,
    'category_name': category_name,
    'commission_rate': commission_rate,
    'commission_type': commission_type,
    'coupon_amount': coupon_amount,
    'coupon_end_time': coupon_end_time,
    'coupon_id': coupon_id,
    'coupon_info': coupon_info,
    'coupon_remain_count': coupon_remain_count,
    'coupon_share_url': coupon_share_url,
    'coupon_start_fee': coupon_start_fee,
    'coupon_start_time': coupon_start_time,
    'coupon_total_count': coupon_total_count,
    'include_dxjh': include_dxjh,
    'include_mkt': include_mkt,
    'info_dxjh': info_dxjh,
    'item_description': item_description,
    'item_id': item_id,
    'item_url': item_url,
    'level_one_category_id': level_one_category_id,
    'level_one_category_name': level_one_category_name,
    'nick': nick,
    'num_iid': num_iid,
    'pict_url': pict_url,
    'provcity': provcity,
    'real_post_fee': real_post_fee,
    'reserve_price': reserve_price,
    'seller_id': seller_id,
    'shop_dsr': shop_dsr,
    'shop_title': shop_title,
    'short_title': short_title,
    'small_images': small_images,
    'title': title,
    'tk_total_commi': tk_total_commi,
    'tk_total_sales': tk_total_sales,
    'url': url,
    'user_type': user_type,
    'volume': volume,
    'white_image': white_image,
    'x_id': x_id,
    'zk_final_price': zk_final_price,
    'kuadian_promotion_info': kuadian_promotion_info,
    'sale_price':sale_price,
    'tmall_play_activity_info':tmall_play_activity_info,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Small_images {
  Small_images({
    this.string,
  });

  factory Small_images.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<String> string = jsonRes['string'] is List ? <String>[] : null;
    if (string != null) {
      for (final dynamic item in jsonRes['string']) {
        if (item != null) {
          string.add(asT<String>(item));
        }
      }
    }
    return Small_images(
      string: string,
    );
  }

  List<String> string;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'string': string,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
