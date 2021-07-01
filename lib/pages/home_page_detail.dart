import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/catalog_model.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/utils/convert.dart';
import 'package:shop_app/widget/detail/add_to_cart.dart';
import 'package:shop_app/widget/detail/increase_or_decrease.dart';
import 'package:shop_app/widget/detail/color_and_size.dart';
import 'package:shop_app/widget/home/home_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePageDetail extends StatelessWidget {
  final Item product;
  const HomePageDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: homeAppBar(context, Colors.white),
      backgroundColor: convertColor(product.color),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                BelowBlock(product: product),
                UpperBlock(
                  product: product,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class BelowBlock extends StatefulWidget {
  final Item product;

  const BelowBlock({Key? key, required this.product}) : super(key: key);

  @override
  _BelowBlockState createState() => _BelowBlockState();
}

class _BelowBlockState extends State<BelowBlock> {
  num count = 1;
  void onAdd() {
    setState(() {
      count++;
    });
  }

  void onDecrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.24),
      padding: EdgeInsets.only(
        top: size.height * 0.12,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          ColorAndSize(product: widget.product),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(widget.product.content),
          ),
          IncreaseOrDecrease(
            count: count,
            onAdd: onAdd,
            onDecrement: onDecrement,
          ),
          AddToCart(
            product: widget.product, count: count
          )
        ],
      ),
    );
  }
}

class UpperBlock extends StatelessWidget {
  final Item product;
  const UpperBlock({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(product.desc, style: TextStyle(color: Colors.white)),
          SizedBox(
            height: kDefaultPaddin,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Hero(
                  tag: product.id,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                        imageUrl: product.image,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
