import 'package:product_mngr/data/data_provider.dart';
import 'package:product_mngr/product/data/model/product_model.dart';

class ProductRepository {
  DataProvider dataProvider = DataProvider();
  Future<List<Product>> getProduct() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://dummyjson.com/products");
      if (response.statusCode == 200) {
        List<Product> products =
            ProductModel.fromRawJson(response.body).products;
        return products;
      } else {
        throw "Error Loading Product";
      }
    } catch (e) {
      rethrow;
    }
  }
}
