import 'package:get/get.dart';
import '../models/book.dart';

class CartController extends GetxController {
  var cart = <Book>[].obs;

  void addToCart(Book book) {
    cart.add(book);
  }

  void removeFromCart(Book book) {
    cart.remove(book);
  }
}
