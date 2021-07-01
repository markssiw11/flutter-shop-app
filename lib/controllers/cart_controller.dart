import 'package:get/get.dart';
import 'package:shop_app/models/cart_item_model.dart';
import 'package:shop_app/models/catalog_model.dart';

class CartController extends GetxController {
  RxList items = <CartItem>[].obs;
  num get totalQuatity {
    num len = items.fold(0, (total, element) => total + element.quantity);
    return len;
  }

  void addToCart(Item product, num quantity) {
    bool isInCart = items.where((e) => e.id == product.id).isNotEmpty;
    
    CartItem newProduct = CartItem.fromMap({
      "id": product.id,
      "name": product.name,
      "quantity": quantity,
      "desc": product.desc,
      "price": product.price,
      "color": product.color,
      "image": product.image,
      "content": product.content
    });
    if (!isInCart) {
      items.add(newProduct);
    } else {
      
    }
    update();
  }
}
