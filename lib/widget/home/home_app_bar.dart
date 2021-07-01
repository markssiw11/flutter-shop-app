import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:get/get.dart';

AppBar homeAppBar(BuildContext context, Color color) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: color, //change your color here
    ),
    leading: _buildLeadingWidget(context),
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          CupertinoIcons.search,
        ),
        tooltip: 'Show Snackbar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')));
        },
      ),
      BageIcon(),
    ],
  );
}

Widget _buildLeadingWidget(BuildContext context) {
  final bool canPop = ModalRoute.of(context)?.canPop ?? false;

  Widget leading = IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {},
  );

  if (canPop) {
    leading = IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).maybePop(),
    );
  }
  return leading;
}

Stack bageIcon(context, len) {
  return Stack(
    children: [
      Column(
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(top: 8),
            icon: const Icon(
              CupertinoIcons.cart,
            ),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          )
        ],
      ),
      // if (len > 0)
      Positioned(
        top: 5,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          alignment: Alignment.center,
          child: Text(len.toString()),
        ),
      )
    ],
  );
}

class BageIcon extends StatelessWidget {
  const BageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        Column(
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(top: 8),
              icon: const Icon(
                CupertinoIcons.cart,
              ),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
            )
          ],
        ),
        Obx(() =>  Positioned(
              top: 5,
              right: 0,
              child: Opacity(
                opacity: (controller.totalQuatity >0) ? 1.0 : 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration:
                      BoxDecoration(
                        shape: BoxShape.circle,
                        color:  Colors.red),
                  alignment: Alignment.center,
                  // child: Obx(() => Text("${controller.totalQuatity}")),
                  child:  Text("${controller.totalQuatity}"),
                ),
              ),
            )),
      ],
    );
  }
}
