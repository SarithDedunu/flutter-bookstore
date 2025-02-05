import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/book_details.dart';
import '../models/book.dart';
import '../widgets/book_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
        id: 1,
        title: "Flutter for Beginners",
        author: "John Doe",
        price: 29.99),
    Book(id: 2, title: "Dart in Action", author: "Jane Smith", price: 34.99),
    Book(
        id: 3, title: "Mastering Flutter", author: "Alice Brown", price: 39.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bookstore")),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookWidget(
            book: books[index],
            onTap: () {
              Get.to(() => BookDetailsScreen(book: books[index]));
            },
          );
        },
      ),
    );
  }
}
