import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/order_bloc/order_bloc.dart';
import '../../../blocs/user_bloc/user_bloc.dart';
import '../../../data/models/order/order_request.dart';
import '../../../data/models/product.dart';
import '../../../data/models/user.dart';
import '../../widgets/my_divider.dart';
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_show_snackbar.dart';
import 'widgets/snap_midtrans_widget.dart';
import 'widgets/checkout_product_item.dart';
import 'widgets/delivery_address.dart';
import 'widgets/payment_details.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final productSet = products.toSet();

    int shippingCosts = 25000;
    int totalPrice = products.fold<int>(
      0,
      (int previousValue, Product product) {
        return previousValue + product.attributes.price;
      },
    );
    int totalPayment = totalPrice + shippingCosts;
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
      body: ListView(
        children: [
          const DeliveryAddress(),
          const MyDivider(),
          Container(
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
          ),
          const MyDivider(),
          PaymentDetails(
            shippingCosts: shippingCosts,
            totalPrice: totalPrice,
            totalPayment: totalPayment,
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      totalPayment.toRupiah(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocListener<OrderBloc, OrderState>(
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
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyElevatedButton(
                    title: 'Buat Pesanan',
                    onPressed: () {
                      context.read<UserBloc>().add(GetUserEvent());
                      final User user = context.read<UserBloc>().state.user!;
                      if (user.address != null) {
                        final Data data = Data(
                          products: products,
                          shippingCosts: shippingCosts,
                          status: 'waitingPayment',
                          totalPrice: totalPrice,
                          totalPayment: totalPayment,
                          user: user,
                          userId: user.id,
                        );
                        final OrderRequest orderRequest =
                            OrderRequest(data: data);
                        context.read<OrderBloc>().add(
                              CreateOrderEvent(orderRequest: orderRequest),
                            );
                      } else {
                        myShowSnackBar(
                          context,
                          content: 'Pastikan alamat sudah terisi',
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
