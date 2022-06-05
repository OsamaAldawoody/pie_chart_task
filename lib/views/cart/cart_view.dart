import 'package:flutter/material.dart';
import 'package:pie_chart_task/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'empty_cart.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    debugPrint(cart.itemsMap.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: cart.isCartEmpty()
          ? const EmptyCart()
          : ListView(
              shrinkWrap: true,
              children: cart.itemsMap.entries
                  .map((item) => ListTile(
                        title: Text(item.key),
                        subtitle: Row(
                          children: [
                            IconButton(
                                onPressed: () => cart.addDrink(item.key),
                                icon: const Icon(Icons.add)),
                            Text(cart.itemsMap[item.key].toString()),
                            IconButton(
                                onPressed: () => cart.removeDrink(item.key),
                                icon: const Icon(Icons.remove)),
                          ],
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
