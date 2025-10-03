import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_drawer.dart';
import 'package:minimal_shop/components/my_product_tile.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
        actions: [
          // go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/card_page'),
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          // shop subtile
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // product list
          SizedBox(
            height: 570,
            child: ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.all(25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get each individual products from shop
                final product = products[index];

                // return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
