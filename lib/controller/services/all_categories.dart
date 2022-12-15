import 'package:my_store_app/controller/api/api.dart';

import '../../view/settings/app_string.dart';

class AllCategoriesService {
  Future<dynamic> getAllCategories() async {
    var data = await Api().get("${AppString.baseUrl}/categories");

    print(data);

    return data;
  }
}
