

import 'package:product_sample/modules/home/data/static_product_data.dart';
import 'package:product_sample/modules/home/models/product_model.dart';

class HomepageRepo {
  static Future<List<Product>> getHomePageList() async {
    // http.get(Constant.getHomelist)
    return productList;
  }

 static Future<Product> updateProduct(int id) async {
    // http.put()
    final sampleProduct = productList.firstWhere((element) => element.id == id);
    sampleProduct.price = 200;
    return sampleProduct;
  }
}
