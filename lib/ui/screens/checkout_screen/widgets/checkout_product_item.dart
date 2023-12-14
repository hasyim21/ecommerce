import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/product.dart';

class CheckoutProductItem extends StatelessWidget {
  const CheckoutProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 91,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            '$baseUrl${product.attributes.images.first}',
            width: 75.0,
            height: 75.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Column(
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
              Text(product.attributes.sizes.first.size),
            ],
          ),
        ],
      ),
    );
  }
}
