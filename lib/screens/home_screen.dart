import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: "The Alchemist",
      author: "Paulo Coelho",
      price: "1500",
      imagePath: "assets/images/1.The_Alchemist.jpg",
      description:
          'A mesmerizing tale of self-discovery, following Santiago on his journey to find treasure and fulfill his destiny',
    ),
    Book(
      title: "Turtles All the Way Down",
      author: "John Green",
      price: "2800",
      imagePath: "assets/images/2.Turtles all the way down.jpg",
      description:
          'A deeply emotional novel exploring mental health, friendship, and self-identity through the journey of Aza Holmes.',
    ),
    Book(
      title: "It Ends With Us",
      author: "Colleen Hoover",
      price: "2000",
      imagePath: "assets/images/3.It_ends_with_us.jpg",
      description:
          'A powerful romance novel that delves into love, loss, and the complexities of relationships, inspired by real-life events.',
    ),
    Book(
      title: "Last of August",
      author: "Brittany Cavallaro",
      price: "1700",
      imagePath: "assets/images/4.Last_of_august.jpg",
      description:
          'A thrilling Sherlock Holmes-inspired mystery featuring Charlotte Holmes and Jamie Watson on a dangerous adventure.',
    ),
    Book(
      title: "Moby Dick",
      author: "Herman Melville",
      price: "1600",
      imagePath: "assets/images/5.Moby_dick.jpg",
      description:
          "A literary classic following Captain Ahab's obsessive quest to hunt the elusive white whale, Moby Dick.",
    ),
    Book(
      title: "The Doomsday Conspiracy",
      author: "Sidney Sheldon",
      price: "1900",
      imagePath: "assets/images/6.Doomsday.jpg",
      description:
          'A gripping thriller where a naval intelligence officer uncovers a global conspiracy while investigating a mysterious UFO sighting.',
    ),
    Book(
      title: "Atomic Habits",
      author: "James Clear",
      price: "3200",
      imagePath: "assets/images/7.Atomic_habits.jpg",
      description:
          'A transformative self-help book that teaches how small habits can lead to remarkable personal and professional success.',
    ),
  ];

  HomeScreen({super.key});

  void addToCart(Book book) {
    print('${book.title} added to cart'); // Replace with actual cart logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ceylon Bookstore'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: books
            .map<Widget>((book) => BookWidget(
                  title: book.title,
                  author: book.author,
                  price: book.price,
                  imagePath: book.imagePath,
                ))
            .toList(),
      ),
    );
  }
}
