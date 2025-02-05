import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book.dart';
import '../controllers/cart_controller.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  final CartController cartController = Get.find();

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Author: ${book.author}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("\$${double.parse(book.price).toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(book);
                Get.snackbar("Success", "Book added to cart!",
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
