import 'package:cwt_ecommerce_admin_panel/features/shop/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/address/address_repository.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/models/user_model.dart';

class CustomerDetailController extends GetxController {
  static CustomerDetailController get instance => Get.find();

  RxBool ordersLoading = true.obs;
  RxBool addressesLoading = true.obs;
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  RxList<bool> selectedRows = <bool>[].obs;
  Rx<UserModel> customer = UserModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  final searchTextController = TextEditingController();
  RxList<OrderModel> allCustomerOrders = <OrderModel>[].obs;
  RxList<OrderModel> filteredCustomerOrders = <OrderModel>[].obs;

  /// -- Load customer orders
  Future<void> getCustomerOrders() async {
    try {
      // Show loader while loading categories
      ordersLoading.value = true;


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      ordersLoading.value = false;
    }
  }

  /// -- Load customer orders
  Future<void> getCustomerAddresses() async {
    try {
      // Show loader while loading categories
      addressesLoading.value = true;

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      addressesLoading.value = false;
    }
  }

  /// -- Search Query Filter
  void searchQuery(String query) {
    filteredCustomerOrders.assignAll(
      allCustomerOrders.where((customer) =>
          customer.id.toLowerCase().contains(query.toLowerCase()) || customer.orderDate.toString().contains(query.toLowerCase())),
    );

    // Notify listeners about the change
    update();
  }

  /// Sorting related code
  void sortById(int sortColumnIndex, bool ascending) {
    sortAscending.value = ascending;
    filteredCustomerOrders.sort((a, b) {
      if (ascending) {
        return a.id.toLowerCase().compareTo(b.id.toLowerCase());
      } else {
        return b.id.toLowerCase().compareTo(a.id.toLowerCase());
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;

    update();
  }
}
