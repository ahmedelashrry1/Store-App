import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/prodect_model.dart';

class AddProduct {
  Future<ProdectModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      }, token: '',
    );

    return ProdectModel.fromJson(data);
  }
}
