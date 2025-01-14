
import 'package:flutter_ecommerce/common/widgets/network/network_manager.dart';
import 'package:flutter_ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:flutter_ecommerce/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}