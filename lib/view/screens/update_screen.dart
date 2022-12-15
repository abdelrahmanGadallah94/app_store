import 'package:flutter/material.dart';
import 'package:my_store_app/modal/all_products_modal.dart';

import '../../controller/services/update_product.dart';
import '../settings/app_colors.dart';
import '../settings/app_string.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class UpdateScreen extends StatelessWidget {

  String? title;
  String? price;
  String? description;
  String? category;
  String? image;

  UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllProductsModal product =  ModalRoute.of(context)!.settings.arguments as AllProductsModal;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kWhiteColor,
        elevation: 0,
        title: const Text(
          AppString.updateProduct,
          style: TextStyle(color: AppColors.kBlackColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 100),
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
                await update(product);
                try{
                  // await update(product);
                }catch (e){
                  print(e.toString());
                }
              },
              buttonColor: AppColors.kButtonColor,
              text: AppString.update,
              textColor: AppColors.kWhiteColor,
            )
          ],
        ),
      ),
    );
  }

  Future<void> update(product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: title == null? product.title : title!,
      price: price == null? product.price : "${price!}\$",
      description: description == null? product.description : description!,
      image: image == null? product.image : image!,
      category: product.category,
    );
  }
}
