  import 'package:store_app/helpers/api.dart';

  class GetAllCategory {
    Future<List<dynamic>> getAllCategories() async {
      // استدعاء API باستخدام الفئة العامة Api
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories', token: '');
      return data;
    }
  }
