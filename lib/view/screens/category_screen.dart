import 'package:flutter/material.dart';

import '../../controller/services/get_category.dart';
import '../settings/app_colors.dart';
import '../widgets/products_cart.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kGreyColor,
        elevation: 0,
        title: Text(
          categoryName,
          style: const TextStyle(color: AppColors.kBlackColor),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: GetCategoryService().getCategory(categoryName: categoryName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var products = snapshot.data;
            return Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              child: GridView.builder(
                clipBehavior: Clip.none,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return ProductsCart(product: products[index]);
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
