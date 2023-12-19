import 'package:flutter/material.dart';

import '../../../../data/models/order/order.dart';

class TransactionDetailAddress extends StatelessWidget {
  const TransactionDetailAddress({
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
                Icons.location_on_outlined,
                size: 20.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text('Alamat Pengiriman'),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${order.attributes.user.address!.fullName} | ${order.attributes.user.address!.phoneNumber}',
                style: const TextStyle(
                  fontSize: 12.5,
                ),
              ),
              Text(
                '${order.attributes.user.address!.otherDetails}, ${order.attributes.user.address!.subdistrict}, ${order.attributes.user.address!.regency}, ${order.attributes.user.address!.province}, ${order.attributes.user.address!.postalCode}',
                style: const TextStyle(
                  fontSize: 12.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
