import 'package:fakestore/app/data/database/db.dart';
import 'package:fakestore/app/data/provider/network_apiServices.dart';
import 'package:fakestore/app/model/product_model.dart';
import 'package:fakestore/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  
  final _apiService = NetworkApiServices();
  List<ProductModel> products = <ProductModel>[].obs;

  Future<dynamic>getAllProducts()async{
    _apiService.getApi("https://fakestoreapi.com/products").then((value){
      if(value!=null){
        for(var data in value){
         products.add(ProductModel.fromJson(data));
         print(products);
        }
      }
    });
  }
  Future<void> addToCart({
    required int productId,
    required String name,
    required double price,
    required int quantity,
    required String imageUrl
  }) async {
    SqlService db = SqlService();

    try {

       await db.addToCart(
        productId: productId,
        name: name,
        price: price,
        quantity: quantity,
         imageUrl: imageUrl
      );
       Get.toNamed(AppRoutes.cartPage);
      print("Item added to cart successfully");
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }
}