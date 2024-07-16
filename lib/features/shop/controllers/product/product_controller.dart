

import 'package:flutter_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:flutter_ecommerce/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce/utils/constants/enums.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/product/product_repository.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;

 RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async{
    try{
      // show loader while loading products
      isLoading.value = true;

      // Fetch Products
      final productRepository = Get.put(ProductRepository());
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);

    }catch(e){
      print('Error: $e');
       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async{
    try{

      // Fetch Products
      final productRepository = Get.put(ProductRepository());
      final products = await productRepository.getFeaturedProducts();

      return products;
    }catch(e){
      print('Error: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
// Get the product price or price range for variations
  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return the single price or sale price
    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else{
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available , otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;

        // Update smallest And largest prices
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }

      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else{
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  // calculate discount percentage
String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice ==null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice- salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);

}

// Check Product Stoke status
String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
}
}