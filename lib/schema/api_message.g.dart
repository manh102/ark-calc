// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMessage _$ApiMessageFromJson(Map<String, dynamic> json) {
  return ApiMessage(
    key: json['key'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ApiMessageToJson(ApiMessage instance) =>
    <String, dynamic>{
      'key': instance.key,
      'message': instance.message,
    };
