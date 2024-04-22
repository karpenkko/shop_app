import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/shop.dart';
import '../pages/reservation_page.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  final bool showButton;

  const ProductTile({
    super.key,
    required this.product,
    required this.showButton,
  });



  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  bool reservationResult = false;

  @override
  void initState() {
    super.initState();
    reservationResult = context.read<Shop>().showReservation;
  }


  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'Додати цей товар до кошику?',
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
              context.read<Shop>().addToCart(widget.product);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 330,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.product.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontFamily: 'KharkivTone',
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.product.description,
                style: TextStyle(
                  fontFamily: 'DidactGothic',
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.product.price} грн',
                style: TextStyle(
                  fontFamily: 'KharkivTone',
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              if (widget.showButton)
                widget.product.availability
                    ? Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () => addToCart(context),
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    : Row(
                        children: reservationResult
                            ? [
                                const SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Ми повідомимо вам про наявність :)',
                                    style: TextStyle(
                                      fontFamily: 'DidactGothic',
                                      height: 1.2,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ]
                            : [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      bool result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductReservation(),
                                        ),
                                      );
                                      setState(() {
                                        reservationResult = result;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.question_mark,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                      ),
            ],
          ),
        ],
      ),
    );
  }
}
