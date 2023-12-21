import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../../../data/models/product.dart';
import '../../../../data/services/db_service.dart';
import '../../../widgets/my_elevated_button.dart';
import '../../../widgets/my_show_snackbar.dart';
import '../../auth_screen/login_auth_screen.dart';
import '../../checkout_screen/checkout_screen.dart';

class ShoppingBottomBar extends StatelessWidget {
  const ShoppingBottomBar({
    super.key,
    required this.selectedIndex,
    required this.product,
  });

  final int selectedIndex;
  final Product product;

  Future<void> _addToCartButtonPressed(BuildContext context) async {
    if (selectedIndex != -1) {
      final isLogin = await DBService().hasToken();
      if (context.mounted) {
        if (isLogin) {
          context.read<CheckoutBloc>().add(
                AddToCartEvent(
                  product: Product(
                    id: product.id,
                    attributes: Attributes(
                      name: product.attributes.name,
                      brand: product.attributes.brand,
                      price: product.attributes.price,
                      sizes: [product.attributes.sizes[selectedIndex]],
                      images: product.attributes.images,
                    ),
                  ),
                ),
              );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginAuthScreen(),
            ),
          );
        }
      }
    } else {
      myShowSnackBar(
        context,
        content: 'Silakan pilih ukuran terlebih dahulu.',
      );
    }
  }

  Future<void> _buyNowButtonPressed(BuildContext context) async {
    if (selectedIndex != -1) {
      final isLogin = await DBService().hasToken();
      if (context.mounted) {
        if (isLogin) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(
                products: [
                  Product(
                    id: product.id,
                    attributes: Attributes(
                      name: product.attributes.name,
                      brand: product.attributes.brand,
                      price: product.attributes.price,
                      sizes: [product.attributes.sizes[selectedIndex]],
                      images: product.attributes.images,
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginAuthScreen(),
            ),
          );
        }
      }
    } else {
      myShowSnackBar(
        context,
        content: 'Silakan pilih ukuran terlebih dahulu.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.all(8.0),
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
            child: MyElevatedButton(
              title: '+ Keranjang',
              borderColor: Colors.black,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onPressed: () => _addToCartButtonPressed(context),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: MyElevatedButton(
              title: 'Beli Sekarang',
              onPressed: () => _buyNowButtonPressed(context),
            ),
          ),
        ],
      ),
    );
  }
}
