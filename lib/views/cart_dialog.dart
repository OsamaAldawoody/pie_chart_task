import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

import '../models/cart.dart';

void cartDialog(BuildContext context, Cart cart) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Cart',
          )),
      content: cart.isCartEmpty()
          ? const Text(
              'Cart is Empty',
              style: TextStyle(color: Colors.pink, fontSize: 30),
            )
          : ListView(
              shrinkWrap: true,
              children: cart.itemsMap.entries
                  .map((item) => ListTile(
                        title: Text(item.key),
                        subtitle: Row(
                          children: [
                            Text(cart.itemsMap[item.key].toString()),
                          ],
                        ),
                      ))
                  .toList(),
            ),
    ),
  );
}
