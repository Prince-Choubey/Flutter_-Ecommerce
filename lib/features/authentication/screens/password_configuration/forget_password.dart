import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter_ecommerce/utils/constants/text_strings.dart';
import 'package:flutter_ecommerce/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true,),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(TTexts.forgetPasswordTitle, style: Theme
                .of(context)
                .textTheme
                .headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.forgetPasswordSubTitle, style: Theme
                .of(context)
                .textTheme
                .labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections * 2,),

            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>controller.sendPasswordResetEmail(), child: const Text(TTexts.submit))),


          ],
        ),
      ),
    );
  }
}
