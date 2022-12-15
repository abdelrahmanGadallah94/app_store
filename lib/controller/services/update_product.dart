import '../../view/settings/app_string.dart';
import '../api/api.dart';

class UpdateProductService {
  Future<dynamic> updateProduct(
      {required dynamic id,
      required String title,
      required dynamic price,
      required String category,
      required String description,
      required String image}) async {
    var data = await Api().put(url: "${AppString.baseUrl}/$id", body: {
      "id": id.toString(),
      "title": title,
      "price": price.toString(),
      "description": description,
      "image": image,
    });

    print(data);

    return data;
  }
}
