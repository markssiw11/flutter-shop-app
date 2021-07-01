import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/models/catalog_model.dart';
import 'package:shop_app/pages/home_list_page.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/widget/home/home_app_bar.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadingData();
  }

  loadingData() async {

    await Future.delayed(Duration(seconds: 2));

    final catalogJson = await rootBundle.loadString("asserts/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["data"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, Colors.grey),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                 height: 20,
                ),
                Text(
                  'Long Store',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                CategoryList(),
                if (CatalogModel.items.isNotEmpty)
                  ProductList()
                else
                  CircularProgressIndicator()
              ],
            )),
      ),
    );
  }
}



class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    List<String> categories = [ "All", "Iphone", "Ipad", "Macbook", "Playtation"];
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 40.0,
        child: Card(
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index, categories[index]);
          },
        ),
        )
        );
  }

  int selectedIndex = 0;

  Widget _buildItem(int index, String title) {

    return GestureDetector(
        onTap: () {
          selectedIndex = index;
          setState(() {});
        },
        child: Container(
          height: 50,
          width: 100,
          // color: Colors.white,
          child: Center(
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
                  height: 2,
                  width: 50,
                  color: selectedIndex == index
                      ? Colors.black54
                      : Colors.transparent,
                )
              ],
            )),
          ),
        ));
  }
}
