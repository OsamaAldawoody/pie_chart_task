import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.not_interested_rounded, color: Colors.pink, size: 30),
        Text(
          'Cart is Empty',
          style: TextStyle(color: Colors.pink, fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
