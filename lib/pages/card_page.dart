import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from your cart?"),
        actions: [
          // cancel button
          CupertinoButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancle", style: TextStyle(color: Colors.cyan)),
          ),

          // yes button
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text(
              "Yes",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // user pressed to pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "User want to pay! Connect this app to your payment backend!",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Card Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty...!"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual item in cart
                      final item = cart[index];

                      // return as a cart tile UI
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.inverseSurface,
                            child: ClipOval(child: Image.asset(item.imagePath)),
                          ),
                          title: Text(item.name),
                          subtitle: Text(
                            '\$   ${item.price.toStringAsFixed(2)}',
                          ),

                          // remove item from cart
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
