import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

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
                return Center(child: Text("Your cart is empty"));
              }
              return ListView.builder(
                itemCount: cartController.cart.length,
                itemBuilder: (context, index) {
                  final book = cartController.cart[index];
                  return ListTile(
                    leading: Image.asset(book.imagePath, width: 50),
                    title: Text(book.title),
                    subtitle: Text("Rs. ${book.price}"),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        cartController.removeFromCart(book);
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Total: Rs. ${cartController.totalPrice.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (cartController.cart.isNotEmpty) {
                            Get.snackbar("Success", "Checkout completed!");
                            cartController.clearCart();
                          } else {
                            Get.snackbar("Error", "Cart is empty!");
                          }
                        },
                        child: Text("Checkout"),
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
