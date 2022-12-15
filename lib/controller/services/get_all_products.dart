import 'package:my_store_app/controller/api/api.dart';
import 'package:my_store_app/modal/all_products_modal.dart';

import '../../view/settings/app_string.dart';

class AllProductsService {
  Future<dynamic> getAllServices() async {
    var decodedData = await Api().get(AppString.baseUrl);

    List<AllProductsModal> data = [];

    for (int i = 0; i < decodedData.length; i++) {
      data.add(AllProductsModal.fromJson(decodedData[i]));
    }
    return data;
  }
}
