import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/order_bloc/order_bloc.dart';
import '../../../data/models/product.dart';
import '../../widgets/my_divider.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_show_snackbar.dart';
import 'widgets/checkout_product_list.dart';
import 'widgets/create_order_bar.dart';
import 'widgets/snap_midtrans_widget.dart';
import 'widgets/delivery_address.dart';
import 'widgets/payment_details.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.products,
  });

  final List<Product> products;

  int _calculateTotalPrice() {
    return products.fold<int>(
      0,
      (int previousValue, Product product) {
        return previousValue + product.attributes.price;
      },
    );
  }

  int _calculateTotalPayment(
      {required int totalPrice, required int shippingCosts}) {
    int totalPayment = totalPrice + shippingCosts;
    return totalPayment;
  }

  @override
  Widget build(BuildContext context) {
    final productSet = products.toSet();
    int shippingCosts = 25000;
    int totalPrice = _calculateTotalPrice();
    int totalPayment = _calculateTotalPayment(
      totalPrice: totalPrice,
      shippingCosts: shippingCosts,
    );

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
              'Checkout',
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
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.status == OrderStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              const DeliveryAddress(),
              const MyDivider(),
              CheckoutProductList(
                productSet: productSet,
                products: products,
              ),
              const MyDivider(),
              PaymentDetails(
                shippingCosts: shippingCosts,
                totalPrice: totalPrice,
                totalPayment: totalPayment,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.status == OrderStatus.error) {
            myShowSnackBar(
              context,
              content: 'Ada yang salah nih :(',
            );
          }
          if (state.status == OrderStatus.success) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SnapMidtransWidget(
                  url: state.orderResponse!.redirectUrl,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == OrderStatus.loading) {
            return const SizedBox();
          }
          return CreateOrderBar(
            totalPayment: totalPayment,
            products: products,
            shippingCosts: shippingCosts,
            totalPrice: totalPrice,
          );
        },
      ),
    );
  }
}
