import 'package:flutter/material.dart';

import '../../controller/services/add_product.dart';
import '../../controller/services/get_all_products.dart';
import '../settings/app_colors.dart';
import '../settings/app_string.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddProductsScreen extends StatelessWidget {
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;

  @override
  Widget build(BuildContext context) {
    var data = AllProductsService().getAllServices();
    print(data);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kGreyColor,
        elevation: 0,
        title: const Text(
          AppString.addProduct,
          style: TextStyle(color: AppColors.kBlackColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            CustomTextField(
              onChanged: (data) {
                title = data;
              },
              hintText: AppString.title,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              onChanged: (data) {
                price = data;
              },
              hintText: AppString.price,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              onChanged: (data) {
                category = data;
              },
              hintText: AppString.category,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              onChanged: (data) {
                description = data;
              },
              hintText: AppString.description,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              onChanged: (data) {
                image = data;
              },
              hintText: AppString.image,
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () async {
                await AddProductService().addProduct(
                  title: title!,
                  price: price,
                  description: description!,
                  image: image!,
                  category: category!,
                );
                Navigator.pop(context);
              },
              buttonColor: AppColors.kButtonColor,
              text: AppString.addProduct,
              textColor: AppColors.kWhiteColor,
            )
          ],
        ),
      ),
    );
  }
}
