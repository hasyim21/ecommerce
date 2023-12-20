import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/product.dart';

class CheckoutProductItem extends StatelessWidget {
  const CheckoutProductItem({
    super.key,
    required this.product,
    required this.countItem,
  });

  final Product product;
  final int countItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 91,
      width: MediaQuery.of(context).size.width,
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
          CachedNetworkImage(
            imageUrl: '$baseUrl${product.attributes.images.first}',
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
                  children: [
                    Text(product.attributes.sizes.first.size),
                    const Spacer(),
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
