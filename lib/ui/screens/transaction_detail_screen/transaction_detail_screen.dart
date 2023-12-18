import 'package:ecommerce/utils/currency_formater.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../data/models/order/order.dart';
import '../../../data/models/product.dart';
import '../../widgets/my_divider.dart';
import '../../widgets/my_icon_button.dart';
import 'widgets/transaction_detail_address.dart';
import 'widgets/transaction_detail_payment.dart';

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

                    return Container(
                      height: 91.0,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 75.0,
                            width: 75.0,
                            color: Colors.grey,
                            child: Image.network(
                              '$baseUrl${product.attributes.images.first}',
                              fit: BoxFit.cover,
                            ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.attributes.sizes.first.size,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('${countItem}x'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
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
