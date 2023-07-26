import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/util/image_type_enum.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';

class CopyCodeWidget extends StatelessWidget {
  final String code;
  final Function(String code) onCopied;

  const CopyCodeWidget({super.key, required this.code, required this.onCopied});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0.r),
          border: Border.all(color: SoloerColors.copyCodeBorder, width: 1.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 6.r,
              width: 6.r,
              decoration: BoxDecoration(
                color: SoloerColors.copyCodeBorder,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Flexible(
              flex: 13,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: PSText.normalText(
                    code,
                    textAlign: TextAlign.start,
                  ))),
          Flexible(
              flex: 1, child: "assets/images/svg/ic_copy.svg".getImageWidget())
        ],
      ),
    );
  }
}
