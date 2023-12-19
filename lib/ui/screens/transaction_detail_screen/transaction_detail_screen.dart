import 'package:flutter/material.dart';

import '../../../data/models/order/order.dart';
import '../../../data/models/product.dart';
import '../../widgets/my_divider.dart';
import '../../widgets/my_icon_button.dart';
import 'widgets/transaction_detail_address.dart';
import 'widgets/transaction_detail_payment.dart';
import 'widgets/transaction_detail_product_item.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final productSet = order.attributes.products.toSet();
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
              'Detail Transaksi',
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
          TransactionDetailAddress(order: order),
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
                    int countItem = 0;

                    for (var element in order.attributes.products) {
                      if (element == productSet.elementAt(index)) {
                        countItem++;
                      }
                    }

                    final Product product = productSet.elementAt(index);

                    return TransactionDetailProductItem(
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
          TransactionDetailPayment(order: order)
        ],
      ),
    );
  }
}
