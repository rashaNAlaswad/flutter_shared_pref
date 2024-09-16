import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/cart.dart';
import '../../controller/cart_controller.dart';
import 'circular_widget.dart';

class CartItem extends GetView<CartController> {
  const CartItem({super.key, required this.cart, required this.index});

  final Cart cart;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      height: 100,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Image.asset('assets/images/pizza.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                cart.itemName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('${cart.price} \$', style: const TextStyle(fontSize: 14)),
            ],
          ),
          const Spacer(),
          CircularWidget(
            widget: IconButton(
              onPressed: () => controller.decrementItem(index),
              icon: const Icon(Icons.remove),
              iconSize: 15,
            ),
            backgroundColor: Colors.white,
            height: 40,
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cart.quantity.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          CircularWidget(
            widget: IconButton(
              onPressed: () => controller.incrementItem(index),
              icon: const Icon(Icons.add),
              iconSize: 15,
            ),
            backgroundColor: Colors.white,
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }
}
