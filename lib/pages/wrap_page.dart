import 'package:flutter/material.dart';
import 'package:shop_app/pages/shop_page.dart';
import '../widgets/common_bottom_nav_bar.dart';
import 'cart_page.dart';

class WrapPage extends StatefulWidget {
  const WrapPage({super.key});

  @override
  State<WrapPage> createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: 'Магазин',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Кошик',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: CommonBottomNavigationBar(
        selectedIndex: _selectedIndex,
        navigatorKeys: _navigatorKeys,
        children: const [
          ShopPage(),
          CartPage(),
        ],
      ),
    );
  }
}
