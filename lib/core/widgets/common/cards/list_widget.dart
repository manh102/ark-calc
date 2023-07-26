import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';
import 'package:new_ark_calc/core/widgets/common_typedef.dart';

typedef PSListItemBuilder<T> = Widget Function(T item);

class PSListViewWidget<T> extends StatefulWidget {
  final List<T> items;
  final Axis scrollDirection;
  final PSListItemBuilder<T> itemBuilder;
  final PSSeparatorBuilder? separatorBuilder;
  final Function(int index) onTap;
  final ScrollController? controller;
  final double? paddingSpace;
  final double betweenItemSpace;
  final bool hasMoreData;
  final bool isLoadMoreEnable;
  final OnLoadMoreData? onLoadMoreCallback;
  final Future<void> Function()? onPullRefreshCallback;

  const PSListViewWidget(
      {Key? key,
      required this.items,
      this.scrollDirection = Axis.horizontal,
      required this.itemBuilder,
      this.separatorBuilder,
      required this.onTap,
      this.controller,
      this.paddingSpace = 0.0,
      this.betweenItemSpace = 16.0,
      this.hasMoreData = false,
      this.isLoadMoreEnable = false,
      this.onLoadMoreCallback,
      this.onPullRefreshCallback})
      : super(key: key);

  @override
  State<PSListViewWidget<T>> createState() => _PSListViewWidgetState<T>();
}

class _PSListViewWidgetState<T> extends State<PSListViewWidget<T>> {
  bool get shouldShowPaddingSpace => (widget.paddingSpace ?? 0.0) == 0.0;

  int _getItemIndex(int index) {
    if (!shouldShowPaddingSpace) {
      return index - 1;
    }

    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      child: widget.onPullRefreshCallback != null
          ? RefreshIndicator(
              child: _buildListViewWidget(
                  isLoadMoreEnable: widget.isLoadMoreEnable),
              onRefresh: widget.onPullRefreshCallback!)
          : _buildListViewWidget(isLoadMoreEnable: widget.isLoadMoreEnable),
    );
  }

  Widget _buildListViewWidget({bool isLoadMoreEnable = false}) {
    return NotificationListener<ScrollNotification>(
      child: ScrollConfiguration(
        behavior: CupertinoScrollBehavior(),
        child: _buildChildListView(isLoadMoreEnable: isLoadMoreEnable),
      ),
      onNotification: (notification) {
        // scroll to end of list
        if (isLoadMoreEnable &&
            widget.hasMoreData &&
            notification is ScrollEndNotification &&
            (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent)) {
          widget.onLoadMoreCallback!.call();
          return true;
        }
        return false;
      },
    );
  }

  Widget _buildChildListView({bool isLoadMoreEnable = false}) {
    int _currentLength = 0;
    _currentLength = shouldShowPaddingSpace
        ? widget.items.length
        : (widget.items.length + 2);
    _currentLength = isLoadMoreEnable ? (_currentLength + 1) : _currentLength;

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: widget.scrollDirection,
      separatorBuilder: (context, index) {
        if (widget.separatorBuilder != null) {
          if (index == _currentLength - 2) {
            return SizedBox.shrink();
          }
          return widget.separatorBuilder!.call(context, index);
        }

        if (widget.paddingSpace != null) {
          if (index == 0 || index == _currentLength) {
            return gap0;
          }
        }

        return _buildSpacingBox(widget.betweenItemSpace);
      },
      itemBuilder: (context, index) {
        if (widget.paddingSpace != 0) {
          if (index == 0 || index == _currentLength - 1) {
            return _buildSpacingBox(widget.paddingSpace ?? 0.0);
          }
        }

        Widget child = SizedBox.shrink();
        if (isLoadMoreEnable) {
          if (index == _currentLength - 1) {
            if (_shouldShowLoadMoreIndicator(_currentLength, index)) {
              child = LoadMoreWidget();
            } else {
              if (widget.items.isNotEmpty) {
                child = NoMoreDataWidget();
              }
            }
          } else {
            final item = widget.items[_getItemIndex(index)];
            child = widget.itemBuilder(item);
          }
        } else {
          final item = widget.items[_getItemIndex(index)];
          child = widget.itemBuilder(item);
        }

        return GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: _shouldShowLoadMoreIndicator(_currentLength, index)
                ? LoadMoreWidget()
                : child,
          ),
          onTap: () {
            widget.onTap.call(_getItemIndex(index));
          },
        );
      },
      itemCount: _currentLength,
      controller: widget.controller,
      physics: BouncingScrollPhysics(),
    );
  }

  bool _shouldShowLoadMoreIndicator(int currentLength, int itemIndex) {
    bool hasMoreDataIfLoadMoreEnable =
        widget.isLoadMoreEnable && widget.hasMoreData;
    bool isLastItem = itemIndex == currentLength - 1;

    return hasMoreDataIfLoadMoreEnable && isLastItem;
  }

  Widget _buildSpacingBox(double extent) {
    return SizedBox(
      width: widget.scrollDirection == Axis.horizontal ? extent.w : null,
      height: widget.scrollDirection == Axis.vertical ? extent.h : null,
    );
  }
}

class LoadMoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        color: SoloerColors.primary,
      ),
    );
  }
}

class NoMoreDataWidget extends StatelessWidget {
  const NoMoreDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PSText.subtitle(
        "No more data",
        textStyle: PSStyle.t11R.copyWith(
            height: 1.6,
            color: SoloerColors.grey4,
            fontWeight: FontWeight.w400),
        textAlign: TextAlign.start,
      ),
      padding: EdgeInsets.only(
          top: 10.0.h, bottom: 15.0.h, left: 10.0.w, right: 10.0.w),
      alignment: Alignment.center,
    );
  }
}
