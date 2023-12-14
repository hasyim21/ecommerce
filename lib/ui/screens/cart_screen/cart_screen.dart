import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../../data/models/product.dart';
import '../../widgets/auth_widget.dart';
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_icon_button.dart';
import '../checkout_screen/checkout_screen.dart';
import '../wishlist_screen/wishlist_screen.dart';
import 'widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
            const Text(
              'Keranjang',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            MyIconButton(
              icon: Icons.favorite_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WishlistScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
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
                return ListView.separated(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Product product = state.products[index];
                    return CartItem(product: product);
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
          int totalPrice = state.products.fold<int>(
            0,
            (int previousValue, Product product) {
              return previousValue + product.attributes.price;
            },
          );

          if (state.products.isEmpty) {
            return const SizedBox();
          }
          return Container(
            height: 56.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          totalPrice.toRupiah(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyElevatedButton(
                      title: 'Checkout',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CheckoutScreen(products: state.products),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
