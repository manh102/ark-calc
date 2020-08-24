import 'package:json_annotation/json_annotation.dart';

part 'api_message.g.dart';

@JsonSerializable()
class ApiMessage {
  String key;
  String message;

  ApiMessage({
    this.key,
    this.message,
  });

  factory ApiMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMessageToJson(this);
}
