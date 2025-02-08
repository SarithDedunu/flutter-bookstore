import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  final VoidCallback onAddToCart; // ✅ **Added this parameter**

  const BookDetailsScreen({
    required this.book,
    required this.onAddToCart, // ✅ **Ensure this is included**
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                book.imagePath,
                height: 250,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Author: ${book.author}",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: Rs. ${book.price}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 15),
            Text(
              book.description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onAddToCart, // ✅ **Calls function when pressed**
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
