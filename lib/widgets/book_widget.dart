import 'package:flutter/material.dart'; // Importing Flutter's material design package for UI components.
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/book.dart';

class BookWidget extends StatelessWidget {
  final String title; // Title of the book.
  final String author; // Author's name.
  final String price; // Price of the book.
  final String imagePath; // Path to the book's image asset.

  final CartController cartController = Get.find(); // GetX Cart Controller

  BookWidget({
    required this.title,
    required this.author,
    required this.price,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Padding around the widget.
      child: Container(
        padding: const EdgeInsets.all(16), // Internal padding.
        decoration: BoxDecoration(
          color: Colors.white, // Background color.
          borderRadius: BorderRadius.circular(12), // Rounded corners.
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 142, 95, 95).withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    8), // Slightly rounded corners for a polished look
                child: Image.asset(
                  imagePath,
                  height: 220, // **Increased size**
                  width:
                      double.infinity, // Makes sure the image takes full width
                  fit: BoxFit
                      .contain, // Ensures the entire image is displayed without cropping
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Author: $author",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 5),
            Text(
              "Price: Rs. $price",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
              // **Increased font size & added green color for emphasis**
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  cartController.addToCart(
                    Book(
                      title: title,
                      author: author,
                      price: price,
                      imagePath: imagePath,
                      description: "", // Placeholder for now
                    ),
                  );
                  Get.snackbar("Added to Cart", "$title has been added!",
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
