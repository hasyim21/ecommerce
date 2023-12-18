import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/order/order.dart';

class TransactionDetailPayment extends StatelessWidget {
  const TransactionDetailPayment({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 20.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text('Rincian Pembayaran'),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Harga',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                order.attributes.totalPrice.toRupiah(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Ongkos Kirim',
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                order.attributes.shippingCosts.toRupiah(),
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Belanja',
              ),
              Text(
                order.attributes.totalPayment.toRupiah(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
