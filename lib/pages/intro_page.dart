import 'package:flutter/material.dart';
import 'package:shop_app/widgets/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            const Text(
              'Етно шоп',
              style: TextStyle(
                fontFamily: 'KharkivTone',
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 300,
              child: Text(
                'прикраси з використанням природних каменів та мінералів',
                style: TextStyle(
                  fontFamily: 'DidactGothic',
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 18,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 35),
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: Icon(
                Icons.arrow_forward,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
