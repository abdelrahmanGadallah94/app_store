import 'package:flutter/material.dart';

import '../../controller/services/get_all_products.dart';
import '../../modal/all_products_modal.dart';
import '../settings/app_colors.dart';
import '../settings/app_routes.dart';
import '../settings/app_string.dart';
import '../widgets/products_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        elevation: 0,
        title: const Text(
          AppString.products,
          style: TextStyle(color: AppColors.kBlackColor),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, AppRoutes.categoriesPage);
            },
            tooltip: AppString.categories,
            icon: const Icon(Icons.category,color: AppColors.kBlackColor,size: 30,),
          ),
          TextButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.addPage);
              },
              icon: const Icon(Icons.add,color: AppColors.kBlackColor,),
              label: const Text(AppString.addProduct,style: TextStyle(color: AppColors.kBlackColor,),)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined,
                  color: AppColors.kBlackColor, size: 30)),
        ],
      ),
      body: FutureBuilder(
        future: AllProductsService().getAllServices(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AllProductsModal> products = snapshot.data;
            return Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
