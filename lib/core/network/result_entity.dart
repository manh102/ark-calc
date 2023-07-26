import 'package:new_ark_calc/core/network/state.dart';
import 'package:new_ark_calc/core/network/task_type.dart';

import 'json_convert_base.dart';

bool isType<T1, T2>() => T1 == T2;
Type typeOf<X>() => X;

class ResultEntity<T> {
  TaskResult? result; //Network request result
  Map<String, dynamic>? responseJson; //response data value
  late bool error;
  late String messageCode;
  late String messageContent;

  /// The data returned by the data in the response will only have a value when the result is success and it is parsed.
  T? data;
  Map<String, dynamic>?
      extraData; //Additional parameters added to the request interface, do not participate in the request interface

  ResultEntity(this.result, this.responseJson, {this.extraData}) {
    this.error = NetworkResponse.instance.getResultStatus(responseJson);
    this.messageCode = NetworkResponse.instance.getMessageCode(responseJson);
    this.messageContent =
        NetworkResponse.instance.getMessageContent(responseJson);
    var responseData;
    var nameType = T.toString();
    List<dynamic>? responseDataList;

    if (nameType.startsWith('String')) {
      responseData = NetworkResponse.instance.getDataString(responseJson);
    } else if (nameType.startsWith('int')) {
      responseData = NetworkResponse.instance.getDataInt(responseJson);
    } else if (nameType.startsWith('List')) {
      // Parsing list
      responseDataList = NetworkResponse.instance.getData(responseJson);
    } else {
      // Parsing object
      responseData = NetworkResponse.instance.getData(responseJson);
    }

    if (responseData != null) {
      data = jsonParseData(responseData);
    }

    if (responseDataList != null) {
      data = jsonParseData(responseDataList);
    }
  }

  bool isSuccess() {
    return (result == TaskResult.success);
  }

  T jsonParseData<T>(dynamic responseData) {
    return JsonConvert.fromJsonAsT(responseData);
  }
}
