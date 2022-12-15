import 'package:flutter/material.dart';
import 'package:my_store_app/view/screens/add_products_screen.dart';
import 'package:my_store_app/view/screens/categories_screen.dart';
import 'package:my_store_app/view/screens/category_screen.dart';
import 'package:my_store_app/view/screens/home_screen.dart';
import 'package:my_store_app/view/screens/splash_screen.dart';
import 'package:my_store_app/view/screens/update_screen.dart';
import 'package:my_store_app/view/settings/app_routes.dart';

void main() {
  runApp(const MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.splashPage: (context) => const SplashScreen(),
        AppRoutes.homePage: (context) => const HomeScreen(),
        AppRoutes.updatePage: (context) => UpdateScreen(),
        AppRoutes.categoriesPage: (context) => const CategoriesScreen(),
        AppRoutes.categoryPage: (context) => const CategoryScreen(),
        AppRoutes.addPage: (context) =>  AddProductsScreen(),
      },
      initialRoute: AppRoutes.splashPage,
    );
  }
}
