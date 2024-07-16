import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce/features/shop/screens/product_reviews/widget/progress_indicator_and_rating.dart';
import 'package:flutter_ecommerce/features/shop/screens/product_reviews/widget/rating_progress_indicator.dart';
import 'package:flutter_ecommerce/features/shop/screens/product_reviews/widget/user_review_card.dart';
import 'package:flutter_ecommerce/utils/constants/sizes.dart';
import 'package:flutter_ecommerce/utils/device/device_utility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/colors.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Overall product Ratings
            const TOverallProductRating(),
            const TRatingBarIndicator(rating: 3.5,),
            Text("12,611", style: Theme.of(context).textTheme.bodySmall,),const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// User Reviews list
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),

          ],
        ),
      ),
    );
  }
}


