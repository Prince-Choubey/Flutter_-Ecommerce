import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce/utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemBuilder: (_, __) =>  const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems,),

            Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: TSizes.spaceBtwItems / 2,),
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItems / 2,),
              TShimmerEffect(width: 110, height: 15),
              SizedBox(height: TSizes.spaceBtwItems / 2,),
              TShimmerEffect(width: 80, height: 15),
              Spacer(),
            ],)
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
        itemCount: itemCount,
        shrinkWrap: true,
      ),
    );
  }
}
