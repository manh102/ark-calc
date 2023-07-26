import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';

class SortSegmentButtons extends StatefulWidget {
  const SortSegmentButtons({Key? key}) : super(key: key);

  @override
  State<SortSegmentButtons> createState() => _SortSegmentButtonsState();
}

class _SortSegmentButtonsState extends State<SortSegmentButtons> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: [
        ButtonSegment(
          value: 1,
          icon: Icon(Icons.ac_unit),
          label: PSText.normalText("Chau"),
        ),
        ButtonSegment(
          value: 2,
          icon: Icon(Icons.ac_unit),
          label: PSText.normalText("Chau1"),
        ),
        ButtonSegment(
          value: 3,
          icon: Icon(Icons.ac_unit),
          label: PSText.normalText("Chau2"),
        ),
        ButtonSegment(
          value: 4,
          icon: Icon(Icons.ac_unit),
          label: PSText.normalText("Chau3"),
        ),
        ButtonSegment(
          value: 5,
          icon: Icon(Icons.ac_unit),
          label: PSText.normalText("Chau4"),
        ),
      ],
      selected: {1, 4},
      multiSelectionEnabled: true,
      showSelectedIcon: true,
    );
  }
}
