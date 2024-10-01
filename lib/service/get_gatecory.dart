  import 'package:store_app/helpers/api.dart';

  class GetAllCategory {
    Future<List<dynamic>> getcategory({required String category}) async {
      // استدعاء API باستخدام الفئة العامة Api
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$category', token: '');
      return data;
    }
  }