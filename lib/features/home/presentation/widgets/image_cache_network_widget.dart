import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ark_calc/core/resources/resources.dart';

Widget imageCacheNetWork(String url, double height, double width,
    {BoxFit? fitType}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    imageUrl: url,
    placeholder: (context, url) => CupertinoActivityIndicator(),
    errorWidget: (context, url, error) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.broken_image,
          size: 35,
          color: SoloerColors.grey,
        ),
      ],
    ),
    fit: fitType != null ? fitType : BoxFit.cover,
  );
}
