import 'package:flutter/material.dart';

import '../pages/cart_page.dart';
import 'drawer_list_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DrawerListTile(
                text: 'Магазин',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              DrawerListTile(
                text: 'Кошик',
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: DrawerListTile(
              text: 'Вихід',
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context, rootNavigator: true)
                    .pushNamedAndRemoveUntil('/intro_page', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
