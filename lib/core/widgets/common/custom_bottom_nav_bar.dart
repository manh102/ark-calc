import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';

class PSBottomNavigationBar extends StatefulWidget {
  final List<PSBottomNavBarItem> items;
  final int currentIndex;
  final Function(int) onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? selectedColorOpacity;

  const PSBottomNavigationBar(
      {Key? key,
      required this.items,
      required this.currentIndex,
      required this.onTap,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.selectedColorOpacity})
      : super(key: key);

  @override
  State<PSBottomNavigationBar> createState() => _PSBottomNavigationBarState();
}

class _PSBottomNavigationBarState extends State<PSBottomNavigationBar> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(24.r),
          //   topRight: Radius.circular(24.r),
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24.r,
              offset: Offset(0, -2),
            ),
          ],
        ),
        height: PSSpacing.bottomNavBarHeight,
        width: 1.sw,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: PSSpacing.navHorizontalMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.items.map((e) {
              return _buildIconButton(e);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(PSBottomNavBarItem item) {
    return Flexible(
      fit: FlexFit.tight,
      child: Material(
        color: Colors.white,
        shape: CircleBorder(),
        child: InkWell(
          customBorder: CircleBorder(),
          radius: 150.r,
          onTap: () {
            final tappedIndex = widget.items.indexOf(item);
            widget.onTap(tappedIndex);
            setState(() {
              currentIndex = tappedIndex;
            });
          },
          child: Center(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: [
                Column(
                  children: [
                    item.icon,
                    gapH4,
                    item.title,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PSBottomNavBarItem {
  final Widget icon;
  final Widget? activeIcon;
  final Widget title;
  final Color? selectedColor;
  final Color? unselectedColor;

  PSBottomNavBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}
