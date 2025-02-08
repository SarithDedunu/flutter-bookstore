import 'package:get/get.dart';
import '../models/book.dart';

class CartController extends GetxController {
  // ✅ Change RxList<Book> to RxMap<Book, int> for quantity tracking
  var cart = <Book, int>{}.obs;

  void addToCart(Book book) {
    if (cart.containsKey(book)) {
      cart[book] = cart[book]! + 1; // Increment quantity if already in cart
    } else {
      cart[book] = 1; // Add book with quantity 1 if new
    }
  }

  void removeFromCart(Book book) {
    if (cart.containsKey(book)) {
      if (cart[book]! > 1) {
        cart[book] = cart[book]! - 1; // Reduce quantity
      } else {
        cart.remove(book); // Remove book if quantity becomes 0
      }
    }
  }

  void clearCart() {
    cart.clear();
  }

  double get totalPrice {
    return cart.entries
        .fold(0, (sum, entry) => sum + (entry.key.price * entry.value));
  }
}
