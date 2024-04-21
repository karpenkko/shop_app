import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/cart_list_tile.dart';
import 'package:shop_app/widgets/my_button.dart';
import '../models/product.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeIconFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'Видалити цей товар з кошику?',
          style: TextStyle(
            fontFamily: 'DidactGothic',
            fontSize: 16,
          ),
        ),
        contentPadding:
            const EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 40),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Скасувати',
              style: TextStyle(
                fontFamily: 'DidactGothic',
                fontSize: 16,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text(
              'Так',
              style: TextStyle(
                fontFamily: 'DidactGothic',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        contentPadding:
            EdgeInsets.only(left: 24, right: 24, top: 28, bottom: 30),
        content: Text(
          'Проведення оплати :)',
          style: TextStyle(
            fontFamily: 'DidactGothic',
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Кошик',
          style: TextStyle(
            fontFamily: 'KharkivTone',
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                      'Ваш кошик пустий :(',
                      style: TextStyle(
                        fontFamily: 'DidactGothic',
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return CartListTile(
                        product: item,
                        removeIconFromCart: removeIconFromCart,
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text(
                'Оплатити',
                style: TextStyle(
                  fontFamily: 'KharkivTone',
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
