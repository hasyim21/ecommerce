import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../../../constants/constants.dart';
import '../../../../data/models/product.dart';
import 'quantity_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
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
      height: 123,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
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
          QuantityButton(
            onAddOrder: () {
              context.read<CheckoutBloc>().add(
                    AddToCartEvent(product: product),
                  );
            },
            quantity: countItem,
            onRemoveOrder: () {
              context.read<CheckoutBloc>().add(
                    RemoveFromCartEvent(product: product),
                  );
            },
          ),
        ],
      ),
    );
  }
}
