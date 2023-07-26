import 'package:flutter/material.dart';

typedef OnFavoriteTapped = void Function(bool isLiked);
typedef OnFavoriteInListTapped = void Function(int index, bool isLiked);

typedef OnSearchActionTapped = void Function();
typedef OnFavoriteActionTapped = void Function();
typedef OnFAQActionTapped = void Function();
typedef OnShareActionTapped = void Function();
typedef OnBackTapped = void Function();

typedef OnPositiveButtonTapped = void Function();
typedef OnNegativeButtonTapped = void Function();

typedef OnLoadMoreData = Function();

typedef PSSeparatorBuilder = Widget Function(BuildContext context, int index);

typedef OnSeeMoreTapped = void Function();
