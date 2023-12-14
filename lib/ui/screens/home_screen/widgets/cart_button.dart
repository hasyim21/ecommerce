import 'package:flutter/material.dart';

import '../../cart_screen/cart_screen.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
        child: Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.black,
            ),
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
      ),
    );
  }
}
