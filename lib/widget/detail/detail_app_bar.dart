import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';

AppBar detailAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          CupertinoIcons.search,
          color: Colors.black54,
        ),
        tooltip: 'Show Snackbar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbaraa')));
        },
      ),
      IconButton(
        icon: const Icon(
          CupertinoIcons.cart,
          color: Colors.black54,
        ),
        tooltip: 'Go to the next page',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
      ),
    ],
  );
}
