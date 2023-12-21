import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../../../data/models/product.dart';
import 'cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state.status == CheckoutStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.products.isEmpty) {
          return const Center(
            child: Text('Wah, keranjang belanjamu kosong :('),
          );
        }

        final productSet = state.products.toSet();

        return ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: productSet.length,
          itemBuilder: (BuildContext context, int index) {
            int countItem = _calculateItemCount(
              productSet.elementAt(index),
              state.products,
            );

            final Product product = productSet.elementAt(index);
            return CartItem(product: product, countItem: countItem);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8.0,
            );
          },
        );
      },
    );
  }
}

int _calculateItemCount(Product targetProduct, List<Product> productList) {
  return productList.where((element) {
    return element.id == targetProduct.id &&
        element.attributes.sizes == targetProduct.attributes.sizes;
  }).length;
}
