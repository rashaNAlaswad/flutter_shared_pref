import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/app_shared_pref.dart';
import '../../../routes/app_routes.dart';
import '../controller/cart_controller.dart';
import 'components/cart_item.dart';
import 'components/circular_widget.dart';
import 'components/custome_back_arrow.dart';
import 'components/custome_button.dart';
import 'components/no_data.dart';
import 'components/order_cart_details.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        centerTitle: true,
        leading: const BackArrow(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.login);
              AppSharedPref.clear();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          return ListView(children: [
            controller.cartList.isEmpty
                ? const NoData()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    itemCount: controller.cartList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(controller.cartList[index].id.toString()),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (direction) {
                          controller.removeItemAtIndex(index);
                        },
                        background: Container(
                          padding: const EdgeInsets.only(right: 16),
                          margin: const EdgeInsets.only(
                              right: 16, top: 4, bottom: 12),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        child: CartItem(
                          cart: controller.cartList[index],
                          index: index,
                        ),
                      );
                    },
                  ),
            Visibility(
              visible: controller.cartList.isNotEmpty,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CircularWidget(
                            widget:
                                Icon(Icons.shopping_cart, color: Colors.amber),
                            backgroundColor: Colors.white),
                        const SizedBox(
                          width: 16,
                        ),
                        OrderCartDetails(
                          title: 'Total Items',
                          data: '${controller.calculateTotalItems()} items',
                        ),
                        const Spacer(),
                        OrderCartDetails(
                          title: 'Cost',
                          data:
                              '${controller.calculateTotalPrice().toStringAsFixed(2)}\$',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomeButton(),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
