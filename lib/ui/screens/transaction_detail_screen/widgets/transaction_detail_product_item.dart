import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/product.dart';

class TransactionDetailProductItem extends StatelessWidget {
  const TransactionDetailProductItem({
    super.key,
    required this.product,
    required this.countItem,
  });

  final Product product;
  final int countItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 75.0,
            width: 75.0,
            color: Colors.grey,
            child: Image.network(
              '$baseUrl${product.attributes.images.first}',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.attributes.name),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  product.attributes.price.toRupiah(),
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
                      product.attributes.sizes.first.size,
                    ),
                    Text('${countItem}x'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
