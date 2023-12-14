import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/order/list_order_response.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade200,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(
            '$baseUrl${order.attributes!.products!.first.attributes!.images!.first}',
          ),
        ),
        title: Text(order.attributes!.products!.first.attributes!.name!),
        subtitle: const Text("Programmer"),
      ),
    );
  }
}
