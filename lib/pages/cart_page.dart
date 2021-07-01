import 'package:flutter/material.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
              title: Row(
                children: [
                   Text(controller.items[index]?.name),
                   Text("- Amount: ${controller.items[index]?.quantity}"),

                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {},
              )),
        ),
      ),
    );
  }
}
