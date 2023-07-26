import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

enum ImageTypeEnum {
  NETWORK_IMAGE,
  ASSET_SVG,
  ASSET_IMAGE,
  FILE,
  XFILE,
  UINT8LIST
}

extension ImageTypeExtension on ImageTypeEnum {
  static ImageTypeEnum getTypeFromExtension(dynamic data) {
    if (data is Uint8List) {
      return ImageTypeEnum.UINT8LIST;
    } else if (data is XFile) {
      return ImageTypeEnum.XFILE;
    } else if (data is File) {
      return ImageTypeEnum.FILE;
    } else if (data is String) {
      var dataString = data;
      if (Uri.parse(dataString).host.isNotEmpty) {
        return ImageTypeEnum.NETWORK_IMAGE;
      } else if (dataString.contains(".svg")) {
        return ImageTypeEnum.ASSET_SVG;
      } else {
        return ImageTypeEnum.ASSET_IMAGE;
      }
    }
    return ImageTypeEnum.ASSET_IMAGE;
  }
}

extension ImageWidgetExtension on dynamic {
  Widget _errorBuilder(
      BuildContext context, Object object, StackTrace? stackTrace) =>
      Image.asset(
        'assets/images/png/img_sample.png',
      );

  Widget getImageWidget({double? width, double? height, BoxFit? fit = BoxFit.fill}) {
    var imageType = ImageTypeExtension.getTypeFromExtension(this);

    switch (imageType) {
      case ImageTypeEnum.UINT8LIST:
        return Image.memory(
          this,
          height: height,
          width: width,
          errorBuilder: _errorBuilder,
          fit: fit,
          filterQuality: FilterQuality.high,
        );
      case ImageTypeEnum.FILE:
        return Image.file(
          this as File,
          height: height,
          width: width,
          errorBuilder: _errorBuilder,
          fit: fit,
          filterQuality: FilterQuality.high,
        );
      case ImageTypeEnum.XFILE:
        XFile xFile = this;

        return Image.file(
          File(xFile.path),
          height: height,
          width: width,
          errorBuilder: _errorBuilder,
          fit: fit,
          filterQuality: FilterQuality.high,
        );
      case ImageTypeEnum.NETWORK_IMAGE:
        return FadeInImage.assetNetwork(
          image: this as String,
          height: height,
          width: width,
          fit: fit,
          imageErrorBuilder: _errorBuilder,
          placeholder: 'assets/images/png/img_sample_1.png',
          placeholderFit: BoxFit.fill,
        );
      case ImageTypeEnum.ASSET_SVG:
        return SvgPicture.asset(
          this,
          height: height,
          width: width,
          placeholderBuilder: (context) => _errorBuilder(context, this, null),
          fit: BoxFit.fill,
        );
      case ImageTypeEnum.ASSET_IMAGE:
        return Image.asset(
          this,
          height: height,
          width: width,
          errorBuilder: _errorBuilder,
          fit: fit,
          filterQuality: FilterQuality.high,
        );
      default:
        return Image.asset(
          this,
          height: height,
          width: width,
          errorBuilder: _errorBuilder,
          fit: fit,
          filterQuality: FilterQuality.high,
        );
    }
  }
}
