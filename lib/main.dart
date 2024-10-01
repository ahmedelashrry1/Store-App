// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store_app/pages/IntroScreen.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_prodect.dart';
import 'package:store_app/widget/ProductCard.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => IntroScreen(),
        details_product.id: (context) => details_product(product: ModalRoute.of(context)!.settings.arguments as Product), // تم التعديل هنا
      },
    );
  }
}
