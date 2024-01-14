import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikncode_test/domain/model/sales_list_request_model.dart';
import 'package:vikncode_test/domain/model/sales_list_response_model.dart';
import 'package:vikncode_test/infrastracture/repository.dart';

class MainScreenController extends GetxController {

  final RxInt _pageLength = 1.obs;
  ScrollController scrollController = ScrollController();
  RxBool isLoadingSalesList = false.obs;
  
  RxList<Data> salesListData = <Data>[].obs;

  @override
  void onInit() {
    fetchSalesList();
    scrollController = ScrollController()..addListener(_scrollListener);
    super.onInit();
  }

  loadNextPage() {
    isLoadingSalesList.value = true;
    _pageLength.value++;
    fetchSalesList();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadNextPage();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  Future<void> fetchSalesList() async {
    isLoadingSalesList.value = true;

    final salesData = SalesListRequestModel(
      branchID: 1,
      companyID: "1901b825-fe6f-418d-b5f0-7223d0040d08",
      createdUserID: 62,
      priceRounding: 3,
      pageNo: _pageLength.value,
      itemsPerPage: 30,
      type: 'Sales',
      warehouseID: 1,
    );
    try {
      final result = await Repository().salesList(salesData);
      // log(result!.data!.length.toString(), name: "some");

      if (_pageLength.value == 0) {
        salesListData.value = result!.data!;
      } else {
        salesListData.addAll(result!.data as Iterable<Data>);
      }

      isLoadingSalesList.value = false;
      update();
    } catch (e) {
      isLoadingSalesList.value = false;
    }
  }
}
