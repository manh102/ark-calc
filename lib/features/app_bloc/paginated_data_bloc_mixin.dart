import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/constants/common_const.dart';
import 'package:new_ark_calc/core/error/error_model.dart';

/// This mixin provides pagination functionality for a bloc that loads data from an external source
///
/// It maintains a list of current items, current page index, and a flag indicating if there are more items to load.
///
mixin PaginatedDataBlocMixin<T, E, D> {
  List<T> currentItems = [];

  int pageIndex = 1;
  int limit = CommonConst.kDefaultRedeemTabPageSize;
  bool hasMoreData = false;

  ///
  /// The [updatePaginatedData] method is called when new items are loaded from the external source. It updates the current
  /// items list and the flag indicating if there are more items to load. If there are more items to load, it also updates
  /// the current page index.
  ///
  void updatePaginatedData(
      {required List<T> itemsOnNextPage, required bool hasNextPage}) {
    currentItems.addAll(itemsOnNextPage);
    hasMoreData = hasNextPage;

    if (hasNextPage) {
      pageIndex = pageIndex + 1;
    }
  }

  /// The [resetPaginatedDataParams] method resets the current items list, the flag indicating if there are more items to load,
  /// and the current page index.
  void resetPaginatedDataParams() {
    currentItems.clear();
    hasMoreData = false;
    pageIndex = 1;
  }

  /// The [loadNextPage] method is used to load the next page of items.
  ///
  /// Parameters:
  /// * [loadParam]: A required parameter of generic type [E] that contains the necessary parameters to load the page.
  /// * [loadPageIndex]: A required integer parameter that specifies the index of the page to load.
  /// * [limit]: A required integer parameter that specifies the number of items to load on the page.
  ///
  /// Returns:
  /// * An [Either] object that contains either a [ResponseErrorModel] in case there was an error loading the data, or a list of the loaded items.
  ///
  /// Example:
  /// ```dart
  /// Either<ResponseErrorModel, List<ItemModel>> nextPage = await loadNextPage<ItemModel>(loadParam: someParam, loadPageIndex: 1, limit: 10);
  /// ```
  Future<Either<ResponseErrorModel, D>> loadNextPage(
      {required E loadParam, required int loadPageIndex, required int limit});
}
