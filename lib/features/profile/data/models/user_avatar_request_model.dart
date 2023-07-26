import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

enum ChangeAvatarAction {
  update("update"),
  remove("remove");

  final String value;

  const ChangeAvatarAction(this.value);
}

class UserAvatarRequestModel {
  final XFile file;
  final ChangeAvatarAction action;

//<editor-fold desc="Data Methods">
  const UserAvatarRequestModel({
    required this.file,
    required this.action,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAvatarRequestModel &&
          runtimeType == other.runtimeType &&
          file == other.file &&
          action == other.action);

  @override
  int get hashCode => file.hashCode ^ action.hashCode;

  @override
  String toString() {
    return 'UserAvatarRequestModel{' +
        ' file: $file,' +
        ' action: $action,' +
        '}';
  }

  UserAvatarRequestModel copyWith({
    XFile? file,
    ChangeAvatarAction? action,
  }) {
    return UserAvatarRequestModel(
      file: file ?? this.file,
      action: action ?? this.action,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'file': MultipartFile.fromFileSync(this.file.path),
      'action': this.action,
    };
  }

  factory UserAvatarRequestModel.fromMap(Map<String, dynamic> map) {
    return UserAvatarRequestModel(
      file: map['file'] as XFile,
      action: map['action'] as ChangeAvatarAction,
    );
  }

//</editor-fold>
}
