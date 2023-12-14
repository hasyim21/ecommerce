import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    super.key,
    required this.onAddOrder,
    required this.quantity,
    required this.onRemoveOrder,
  });

  final void Function() onAddOrder;
  final int quantity;
  final void Function() onRemoveOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 83,
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onRemoveOrder,
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text('$quantity'),
          const SizedBox(
            width: 8.0,
          ),
          GestureDetector(
            onTap: onAddOrder,
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
