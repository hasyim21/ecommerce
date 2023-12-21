import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/order_bloc/order_bloc.dart';
import '../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../data/models/order/order_request.dart';
import '../../../../data/models/product.dart';
import '../../../../data/models/user.dart';
import '../../../widgets/my_elevated_button.dart';
import '../../../widgets/my_show_snackbar.dart';

class CreateOrderBar extends StatelessWidget {
  const CreateOrderBar({
    super.key,
    required this.totalPayment,
    required this.products,
    required this.shippingCosts,
    required this.totalPrice,
  });

  final int totalPayment;
  final List<Product> products;
  final int shippingCosts;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
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
          Expanded(
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
                    final OrderRequest orderRequest = OrderRequest(data: data);
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
        ],
      ),
    );
  }
}
