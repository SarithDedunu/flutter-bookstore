import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/book.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.cart.isEmpty) {
                return const Center(child: Text("Your cart is empty"));
              }
              return ListView(
                children: cartController.cart.entries.map((entry) {
                  Book book = entry.key;
                  int quantity = entry.value;

                  return ListTile(
                    leading: Image.asset(
                      book.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(book.title),
                    subtitle: Text("Rs. ${book.price} x $quantity"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle,
                              color: Colors.red),
                          onPressed: () => cartController.removeFromCart(book),
                        ),
                        Text(quantity.toString(),
                            style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon:
                              const Icon(Icons.add_circle, color: Colors.green),
                          onPressed: () => cartController.addToCart(book),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Total: Rs. ${cartController.totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (cartController.cart.isNotEmpty) {
                            Get.snackbar("Success", "Checkout completed!",
                                snackPosition: SnackPosition.BOTTOM);
                            cartController.clearCart();
                          } else {
                            Get.snackbar("Error", "Cart is empty!",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        child: const Text("Checkout"),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
