class NetworkResponse {
  static final NetworkResponse instance = NetworkResponse._internal();

  String _resultStatus = 'error';
  String _code = 'code';
  String _content = 'message';
  String _data = 'data';

  factory NetworkResponse() {
    return instance;
  }

  NetworkResponse._internal();

  bool getResultStatus(Map? json) {
    if (json == null) return false;
    if (!json.containsKey(_resultStatus)) return false;
    return json[_resultStatus] as bool;
  }

  String getMessageCode(Map? json) {
    if (json == null) return '';
    if (!json.containsKey(_code)) return '';
    return json[_code];
  }

  String getMessageContent(Map? json) {
    if (json == null) return '';
    if (!json.containsKey(_content)) return '';
    return json[_content] != null ? (json[_content] as String) : "";
  }

  dynamic getData(Map? json) {
    if (json == null) return null;
    if (!json.containsKey(_data)) return null;
    return json[_data];
  }

  String getDataString(Map? json) {
    if (json == null) return '';
    if (!json.containsKey(_data)) return '';
    return json[_data] ?? '';
  }

  int? getDataInt(Map? map) {
    if (map == null || !map.containsKey(_data)) return null;
    return map[_data] as int;
  }
}

class NetworkState {
  static const int Success = 200;
  static const int TokenTimeOut = 401;
  static const int NetworkNotFound1 = 404;
  static const int NetworkNotFound2 = 408;
  static const int ServerError = 500;
}
