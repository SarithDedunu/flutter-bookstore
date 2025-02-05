import 'package:flutter/material.dart';
import '../models/book.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookWidget({required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(book.author),
      trailing: Text("\$${book.price.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
