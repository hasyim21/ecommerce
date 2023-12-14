import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../data/models/product.dart';
import '../screens/product_detail_screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.child,
  });

  final Product product;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.0,
              color: Colors.grey.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  '$baseUrl${product.attributes.images.first}',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.attributes.brand,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.attributes.name,
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.attributes.price.toRupiah(),
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 8.0,
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
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: child,
        ),
      ],
    );
  }
}
