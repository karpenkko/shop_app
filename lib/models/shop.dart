import 'package:flutter/foundation.dart';
import 'package:shop_app/models/product.dart';

class Shop extends ChangeNotifier{
  final List<Product> _shop = [
    Product(
      name: 'БРАСЛЕТ "ЛАВА"',
      price: 480,
      description: 'Браслет "Лава" виготовлений з вулканічної лави. Він доступний у різних розмірах: Small, Medium та Large, що дозволяє підібрати браслет під індивідуальні зап\'ястя кожного покупця. Діаметр бусин становить 8 мм.',
      imagePath: 'assets/photo1.jpg',
      availability: true,
    ),
    Product(
      name: 'КОЛЬЄ "ШЕЛЕСТ"',
      price: 1350,
      description: 'Кольє створене з низки яскравих натуральних бусин,та срібних ланцюжків, що грайливо похитуються при ходьбі. Сьогодні шелест є однією з найпопулярніших традиційних українських прикрас.',
      imagePath: 'assets/photo2.jpg',
      availability: true,
    ),
    Product(
      name: 'СЕРЕЖКИ "ВІЗІЯ"',
      price: 1950,
      description: 'Сережки "Візія" з перлами є вишуканим аксесуаром, який додає витонченості будь-якому образу. Ці сережки виготовлені з використанням перлів та срібла 925 проби, що забезпечує їх довговічність і стильний вигляд.',
      imagePath: 'assets/photo3.jpg',
      availability: false,
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
