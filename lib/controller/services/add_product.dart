import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_store_app/controller/api/api.dart';
import 'package:my_store_app/view/settings/app_string.dart';

class AddProductService {
  Future<dynamic> addProduct({
    required String title,
    required dynamic price,
    required String description,
    required String image,
    required String category,
  }) async {
    var data = await Api().post(url: AppString.baseUrl, body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });

    print(data);

    return data;
  }
}
