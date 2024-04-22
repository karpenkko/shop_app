import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/intro_page.dart';
import 'package:shop_app/themes/light_mode.dart';
import 'models/shop.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
      },
    );
  }
}
