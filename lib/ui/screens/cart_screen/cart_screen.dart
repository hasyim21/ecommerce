import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../../data/models/product.dart';
import '../../widgets/auth_widget.dart';
import '../../widgets/my_icon_button.dart';
import 'widgets/cart_list.dart';
import 'widgets/checkout_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.isBack = false});

  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (isBack)
                ? MyIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  )
                : const SizedBox(
                    height: 40.0,
                    width: 40.0,
                  ),
            const Text(
              'Keranjang',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40.0,
              width: 40.0,
            ),
          ],
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const CartList();
          }
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const AuthWidget();
        },
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state.products.isEmpty) {
            return const SizedBox();
          }
          int totalPrice = _calculateTotalPrice(state.products);
          return CheckoutBar(products: state.products, totalPrice: totalPrice);
        },
      ),
    );
  }
}

int _calculateTotalPrice(List<Product> products) {
  return products.fold<int>(
    0,
    (int previousValue, Product product) {
      return previousValue + product.attributes.price;
    },
  );
}
