import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/prodect_model.dart';

class GetAllProduct {
  Future<List<ProdectModel>> getAllProducts() async {
    // استدعاء API باستخدام الفئة العامة Api
    var data = await Api().get(url: 'https://fakestoreapi.com/products', token: '');

    // تحويل البيانات إلى قائمة من كائنات ProductModel
    List<ProdectModel> products = [];
    
    // التحقق من أن البيانات هي قائمة (List) قبل تحويلها
    if (data is List) {
      for (var item in data) {
        products.add(ProdectModel.fromJson(item));
      }
    } else {
      throw Exception('Unexpected data format');
    }

    return products;
  }
}