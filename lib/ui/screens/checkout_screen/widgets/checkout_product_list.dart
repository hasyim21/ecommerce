import 'package:flutter/material.dart';

import '../../../../data/models/product.dart';
import 'checkout_product_item.dart';

class CheckoutProductList extends StatelessWidget {
  const CheckoutProductList({
    super.key,
    required this.productSet,
    required this.products,
  });

  final Set<Product> productSet;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 20.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text('Produk'),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          ListView.separated(
            itemCount: productSet.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final countItem = products.where((element) {
                return element.id == productSet.elementAt(index).id &&
                    element.attributes.sizes ==
                        productSet.elementAt(index).attributes.sizes;
              }).length;

              final Product product = productSet.elementAt(index);
              return CheckoutProductItem(
                  product: product, countItem: countItem);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8.0,
              );
            },
          ),
        ],
      ),
    );
  }
}
