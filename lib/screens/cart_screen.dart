import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Obx(() {
        return ListView.builder(
          itemCount: cartController.cart.length,
          itemBuilder: (context, index) {
            final book = cartController.cart[index];
            return ListTile(
              title: Text(book.title),
              subtitle:
                  Text("\$${double.parse(book.price).toStringAsFixed(2)}"),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  cartController.removeFromCart(book);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
