import 'package:my_store_app/controller/api/api.dart';
import 'package:my_store_app/modal/all_products_modal.dart';
import 'package:my_store_app/view/settings/app_string.dart';

class GetCategoryService {
  Future<dynamic> getCategory({
    required String categoryName,
  }) async {
    var data = await Api().get("${AppString.baseUrl}/category/$categoryName");

    List<AllProductsModal> allProducts = [];

    print(data);

    for (int i = 0; i < data.length; i++) {
      allProducts.add(AllProductsModal.fromJson(data[i]));
    }

    return allProducts;
  }
}
