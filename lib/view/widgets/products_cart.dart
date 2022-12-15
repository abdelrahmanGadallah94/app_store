import 'package:flutter/material.dart';

import '../settings/app_colors.dart';
import '../settings/app_routes.dart';
import 'package:flutter/scheduler.dart';


// ignore: must_be_immutable
class ProductsCart extends StatelessWidget {
  var product;
  ProductsCart({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: (){
            print(product.id);
            Navigator.pushNamed(context,AppRoutes.updatePage,arguments: product);
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title.substring(0, 8),style: const TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${product.price.toString()} \$",
                        style: const TextStyle(color: AppColors.kGreyColor,fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: AppColors.kRedColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: -55,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ))
      ],
    );
  }
}
