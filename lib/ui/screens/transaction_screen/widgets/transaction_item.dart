import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/order/order.dart';
import '../../transaction_detail_screen/transaction_detail_screen.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.order,
    required this.countItem,
  });

  final Order order;
  final int countItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 121.0,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.0,
              color: Colors.grey.shade200,
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        '$baseUrl${order.attributes.products.first.attributes.images.first}',
                    errorWidget: (context, url, error) => AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey.shade200,
                        child: Image.asset(
                          "assets/images/no_image.png",
                        ),
                      ),
                    ),
                    width: 75.0,
                    height: 75.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.attributes.products.first.attributes.name),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          order.attributes.products.first.attributes.price
                              .toRupiah(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order.attributes.products.first.attributes.sizes
                                  .first.size,
                            ),
                            Text(
                              '${countItem}x',
                            ),
                          ],
                        ),
                      ],
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
                  Text(
                    '${order.attributes.products.length} produk',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const Spacer(),
                  const Text('Total Belanja:'),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    order.attributes.totalPayment.toRupiah(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetailScreen(order: order),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
