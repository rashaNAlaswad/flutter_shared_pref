import 'package:get/get.dart';

import '../../../data/models/cart.dart';

class CartController extends GetxController {
  List<Cart> cartList = [];

  void incrementItem(int index) {
    cartList[index].quantity += 1;
    update();
  }

  void decrementItem(int index) {
    final item = cartList[index];
    if (item.quantity > 0) {
      item.quantity -= 1;
    }
    if (item.quantity == 0) {
      removeItemAtIndex(index);
    }
    update();
  }

  void removeItemAtIndex(int index) {
    cartList.removeAt(index);
    update();
  }

  double calculateTotalPrice() {
    double total = 0;
    for (final cart in cartList) {
      total += cart.price * cart.quantity;
    }
    return total;
  }

  int calculateTotalItems() {
    int total = 0;
    for (final cart in cartList) {
      total += cart.quantity;
    }
    return total;
  }

  @override
  void onInit() {
    cartList.addAll(List.generate(
        5,
        (index) => Cart(
            id: index + 1,
            itemName: 'Beef Burger',
            image: 'assets/images/pizza.png',
            quantity: 1,
            price: 5.30)));
    super.onInit();
  }
}
