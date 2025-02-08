import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../controllers/cart_controller.dart';

void main() {
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ceylon Bookstore App',
      home: HomeScreen(), // Start with HomeScreen
    );
  }
}
