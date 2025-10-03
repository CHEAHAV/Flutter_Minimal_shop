import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_list_lite.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header : logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 71,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              // shop tile
              SizedBox(height: 25),
              MyListLite(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // card tile
              MyListLite(
                text: "Card",
                icon: Icons.shopping_cart,
                onTap: () {
                  //pop drawer first
                  Navigator.pop(context);

                  // go to card page
                  Navigator.pushNamed(context, '/card_page');
                },
              ),
            ],
          ),
          //exit tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListLite(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/intro_page',
                (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
