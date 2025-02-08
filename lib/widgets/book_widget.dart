import 'package:bookstore_app/screens/book_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/book.dart';
import '../screens/book_details.dart'; // ✅ Import the Book Details Screen

class BookWidget extends StatelessWidget {
  final Book book;
  final CartController cartController = Get.find(); // GetX Cart Controller

  BookWidget({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ✅ Clickable Image
            GestureDetector(
              onTap: () {
                Get.to(() => BookDetailsScreen(
                      book: book,
                      onAddToCart: () =>
                          cartController.addToCart(book), // ✅ Pass function
                    ));
                // Navigate
              },
              child: Image.asset(
                book.imagePath,
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),

            // ✅ Clickable Title
            GestureDetector(
              onTap: () {
                Get.to(() => BookDetailsScreen(
                      book: book,
                      onAddToCart: () =>
                          cartController.addToCart(book), // ✅ Pass function
                    ));
                // Navigate
              },
              child: Text(
                book.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Author: ${book.author}",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 5),
            Text(
              "Price: Rs. ${book.price}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(book);

                // ✅ Show confirmation message
                Get.snackbar(
                  "Success",
                  "${book.title} added to cart!",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.withOpacity(0.8),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 4),
                );
              },
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
