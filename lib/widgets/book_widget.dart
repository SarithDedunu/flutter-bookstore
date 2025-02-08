import 'package:bookstore_app/screens/book_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book.dart';
import '../screens/book_details.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  final VoidCallback onAddToCart;

  const BookWidget({
    required this.book,
    required this.onAddToCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BookDetailsScreen(book: book, onAddToCart: onAddToCart));
      },
      child: Padding(
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
              GestureDetector(
                onTap: () {
                  Get.to(() =>
                      BookDetailsScreen(book: book, onAddToCart: onAddToCart));
                },
                child: Image.asset(book.imagePath,
                    height: 250, fit: BoxFit.contain),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Get.to(() =>
                      BookDetailsScreen(book: book, onAddToCart: onAddToCart));
                },
                child: Text(
                  book.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Author: ${book.author}",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 5),
              Text(
                "Price: Rs. ${book.price}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: onAddToCart,
                  child: const Text("Add to Cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
