import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:flutter_ecommerce/features/personalization/models/address_model.dart';
import 'package:flutter_ecommerce/utils/constants/sizes.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Obx(
      () =>  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(
            title: "Shipping Address",
            buttonTitle: "Change",
            onPressed: () => addressController.selectNewAddressPopup(context),
          ),
         addressController.selectedAddress.value.id.isNotEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Prince",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    "(+122) (625) (454)",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_history,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                      child: Text(
                        addressController.selectedAddress.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      ))
                ],
              ),
            ],
          ) : Text("Select Address", style: Theme.of(context).textTheme.bodyMedium,)


        ],
      ),
    );
  }
}
