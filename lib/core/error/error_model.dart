class ResponseErrorModel {
  ResponseErrorModel({this.msgCode = '', this.msgContent = ''});

  final String msgCode;
  final String msgContent;
}

extension ResponseErrorModelExt on ResponseErrorModel {
  static const timeOutErrorCode = "401";

  bool get isTimeOut {
    return msgCode.contains(timeOutErrorCode);
  }
}
