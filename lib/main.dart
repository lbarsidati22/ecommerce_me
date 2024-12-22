import 'package:ecommerce_me/layout/layout_screen.dart';
import 'package:ecommerce_me/screens/home_page.dart';
import 'package:ecommerce_me/screens/splach_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LayoutScreen(),
    );
  }
}
