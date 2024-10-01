import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/prodect_model.dart';

class UpdateProduct {
  Future<ProdectModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required String id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
      token: '',
    );

    return ProdectModel.fromJson(data);
  }
}