import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/catalog_model.dart';
import 'package:shop_app/pages/home_page_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/utils/convert.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> products = CatalogModel.items;
    return new Expanded(
      child: Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 3 / 4),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final Item product = products[index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    // side: BorderSide(color: Colors.red)
                  ),
                  color: convertColor(product.color),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageDetail(
                                    product: products[index],
                                  )));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        mainImage(products[index].id, product.image),
                        Text(
                          products[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          products[index].desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

Hero mainImage(tag, product) {
  return Hero(
      tag: tag,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: CachedNetworkImage(
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
            ),
            imageUrl: product,
            width: 100,
            height: 150,
          )));
}


