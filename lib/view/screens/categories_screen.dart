import 'package:flutter/material.dart';
import 'package:my_store_app/view/settings/app_routes.dart';

import '../../controller/services/all_categories.dart';
import '../settings/app_colors.dart';
import '../settings/app_string.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        title: const Text(
          AppString.categories,
          style: TextStyle(color: AppColors.kBlackColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kGreyColor,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: AllCategoriesService().getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.1,
                    mainAxisSpacing: 5),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(snapshot.data[index]);
                      Navigator.pushNamed(context, AppRoutes.categoryPage,arguments:  snapshot.data[index]);
                    },
                    child: Card(
                      elevation: 10,
                      child: Center(
                        child: Text(
                          snapshot.data[index],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
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
