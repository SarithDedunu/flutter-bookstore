import 'package:get/get.dart';
import '../models/book.dart';

class CartController extends GetxController {
  var cart = <Book>[].obs; // Observable list of books in the cart

  void addToCart(Book book) {
    cart.add(book);
  }

  void removeFromCart(Book book) {
    cart.remove(book);
  }

  // Fix: Remove commas before parsing price to double
  double get totalPrice => cart.fold(
        0,
        (sum, book) => sum + double.parse(book.price.replaceAll(',', '')),
      );

  void clearCart() {
    cart.clear();
  }
}
