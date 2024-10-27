import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/database/db.dart';

class CartController extends GetxController {
  SqlService service = SqlService();
  RxList<Map<String, dynamic>> cartProducts = <Map<String, dynamic>>[].obs;

  Future<void> getCartProducts() async {
    try {
      var data = await service.getCartItems();
      for (var product in data) {
        cartProducts.add(product);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteItem({required int productId}) async {
    try {
      await service.deleteItem(productId: productId);
      cartProducts.removeWhere((product) => product["productid"] == productId);
      print("item deleted");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> increment({required int productid}) async {
    final productIndex = cartProducts.indexWhere((product) => product["productid"] == productid);

    if (productIndex != -1) {
      var product = Map<String, dynamic>.from(cartProducts[productIndex]);

      int currentQuantity = product["quantity"];
      currentQuantity++;

      product["quantity"] = currentQuantity;

      cartProducts[productIndex] = product;

      try {
        await service.updateDb(quantity: currentQuantity, productid: productid);
      } catch (e) {
        print(e.toString());
      }
    }
  }
  Future<void> decrement({required int productid}) async {
    final productIndex = cartProducts.indexWhere((product) => product["productid"] == productid);

    if (productIndex >=1) {
      var product = Map<String, dynamic>.from(cartProducts[productIndex]);

      int currentQuantity = product["quantity"];
      if(currentQuantity>1){
        currentQuantity--;
      }


      product["quantity"] = currentQuantity;

      cartProducts[productIndex] = product;

      try {
        await service.updateDb(quantity: currentQuantity, productid: productid);
      } catch (e) {
        print(e.toString());
      }
    }
  }

}
