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

class FeedRichMsgListResponseModel {
  FeedRichMsgListResponseModel({
    this.code,
    this.message,
    this.data,
  });

  factory FeedRichMsgListResponseModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<FeedRichMsgModel> data =
        jsonRes['data'] is List ? <FeedRichMsgModel>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']) {
        if (item != null) {
          data.add(FeedRichMsgModel.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return FeedRichMsgListResponseModel(
      code: asT<int>(jsonRes['code']),
      message: asT<String>(jsonRes['message']),
      data: data,
    );
  }

  int code;
  String message;
  List<FeedRichMsgModel> data;

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

class FeedRichMsgModel {
  FeedRichMsgModel({
    this.msgtype,
    this.text,
    this.image,
    this.msgID,
    this.msgTime,
  });

  factory FeedRichMsgModel.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : FeedRichMsgModel(
              msgtype: asT<String>(jsonRes['msgtype']),
              text: FeedRichMsgModelText.fromJson(
                  asT<Map<String, dynamic>>(jsonRes['text'])),
              image: FeedRichMsgModelImage.fromJson(
                  asT<Map<String, dynamic>>(jsonRes['image'])),
              msgID: asT<String>(jsonRes['msgID']),
              msgTime: asT<String>(jsonRes['msgTime']),
            );

  String msgtype;
  FeedRichMsgModelText text;
  FeedRichMsgModelImage image;
  String msgID;
  String msgTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'msgtype': msgtype,
        'text': text,
        'image': image,
        'msgID': msgID,
        'msgTime': msgTime,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class FeedRichMsgModelText {
  FeedRichMsgModelText({
    this.content,
  });

  factory FeedRichMsgModelText.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : FeedRichMsgModelText(
              content: asT<String>(jsonRes['content']),
            );

  String content;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class FeedRichMsgModelImage {
  FeedRichMsgModelImage({
    this.picURL,
    this.filePath,
  });

  factory FeedRichMsgModelImage.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : FeedRichMsgModelImage(
              picURL: asT<String>(jsonRes['picURL']),
              filePath: asT<String>(jsonRes['filePath']),
            );

  String picURL;
  String filePath;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'picURL': picURL,
        'filePath': filePath,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
