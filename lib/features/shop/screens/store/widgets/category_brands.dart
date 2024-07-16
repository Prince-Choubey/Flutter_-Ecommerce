import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:flutter_ecommerce/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:flutter_ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:flutter_ecommerce/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce/utils/helpers/cloud_helper_functions.dart';

import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandForCategory(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            children: [
              TListTileShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TBoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No brands found.'));
        }

        final brands = snapshot.data!;
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 100.0, // or any value you think is appropriate
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                      children: [
                        TListTileShimmer(),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        TBoxesShimmer(),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found.'));
                  }

                  final products = snapshot.data!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
                    child: TBrandShowCase(
                      brand: brand,
                      images: products.map((e) => e.thumbnail).toList(),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
