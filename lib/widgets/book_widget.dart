import 'package:flutter/material.dart'; // Importing Flutter's material design package for UI components.

class BookWidget extends StatelessWidget {
  // Defining a stateless widget called BookWidget. This widget represents a book item in the app.

  // Declaring final variables to store book details.
  final String title; // Title of the book.
  final String author; // Author's name.
  final String price; // Price of the book.
  final String imagePath; // Path to the book's image asset.
  final VoidCallback
      onAddToCart; // Function that will be executed when the "Add to Cart" button is pressed.

  // Constructor to initialize the book details.
  const BookWidget({
    required this.title, // Required title parameter.
    required this.author, // Required author parameter.
    required this.price, // Required price parameter.
    required this.imagePath, // Required imagePath parameter.
    required this.onAddToCart, // Required callback function.
    super.key, // Passing the key to the superclass.
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
          12.0), // Adds padding around the entire book widget.
      child: Container(
        padding: const EdgeInsets.all(16), // Adds padding inside the container.
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the book container.
          borderRadius: BorderRadius.circular(12), // Rounded corners.
          boxShadow: [
            // Adding a shadow effect to give a 3D look.
            BoxShadow(
              color: const Color.fromARGB(255, 142, 95, 95)
                  .withOpacity(0.3), // Light grey shadow with reduced opacity.
              blurRadius: 5, // How much the shadow should blur.
              spreadRadius: 2, // How much the shadow should spread.
              offset: Offset(0, 3), // Moves the shadow slightly downward.
            ),
          ],
        ),
        child: Column(
          // Arranges the book details in a vertical layout.
          crossAxisAlignment:
              CrossAxisAlignment.center, // Aligns text to the start (left).
          children: [
            Center(
                child: Image.asset(imagePath, height: 200, fit: BoxFit.cover)),
            // Displays the book cover image with a fixed height.

            const SizedBox(
                height: 15), // Adds spacing between the image and text.

            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // Displays the book title in bold with a larger font.
            ),

            Text(
              "Author: $author",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              // Displays the author's name in a smaller grey font.
            ),

            const SizedBox(height: 5), // Adds spacing between author and price.

            Text(
              "Price: Rs. $price",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // Displays the price in a slightly larger and bold font.
            ),

            const SizedBox(height: 10), // Adds spacing before the button.

            SizedBox(
              width: 150, // Makes the button take full width of the container.
              child: ElevatedButton(
                onPressed: onAddToCart, // Calls the function when clicked.
                child: Text("Add to Cart"), // Button label.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
