import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/models/catalog_model.dart';

class AddToCart extends StatelessWidget {
  final Item product;
  final num count;
  const AddToCart({Key? key, required this.product, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
    final _cartController = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          ButtonIcon(icon: CupertinoIcons.shopping_cart),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  _cartController.addToCart(product, count);
                },
                child: const Text('BUY NOW'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final IconData icon;

  const ButtonIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double horizontal = 7.0;
    const double vertical = 5.0;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: horizontal, vertical: vertical),
        child: Icon(
          icon,
          color: Colors.grey,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
