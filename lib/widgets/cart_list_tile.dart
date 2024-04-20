import 'package:flutter/material.dart';
import '../models/product.dart';
import '../pages/detail_page.dart';

class CartListTile extends StatelessWidget {
  final Product product;
  final void Function(BuildContext, Product)? removeIconFromCart;

  const CartListTile({
    super.key,
    required this.product,
    required this.removeIconFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 14.0, left: 8, right: 0, bottom: 14),
        margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Text(
            product.name,
            style: const TextStyle(
              fontFamily: 'KharkivTone',
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            '${product.price} грн',
            style: const TextStyle(
              fontFamily: 'DidactGothic',
              fontSize: 16,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Icon(
                Icons.remove,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => removeIconFromCart!(context, product),
            ),
          ),
        ),
      ),
    );
  }
}
