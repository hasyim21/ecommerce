import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/order_bloc/order_bloc.dart';
import '../../../../data/models/order/order.dart';
import 'transaction_item.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({
    super.key,
  });

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetOrdersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.status == OrderStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.orders.isEmpty) {
          return const Center(
            child: Text('Wah, transaksimu kosong :('),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: state.orders.length,
          itemBuilder: (BuildContext context, int index) {
            final Order order = state.orders[index];
            final countItem = _calculateItemCount(order);

            return TransactionItem(order: order, countItem: countItem);
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

int _calculateItemCount(Order order) {
  // Membuat map untuk menyimpan jumlah produk berdasarkan ID dan ukuran
  final Map<String, int> productCountMap = {};

  // Menghitung jumlah setiap produk dalam pesanan
  for (var product in order.attributes.products) {
    final key = "${product.id}_${product.attributes.sizes.first.size}";

    if (productCountMap.containsKey(key)) {
      productCountMap[key] = productCountMap[key]! + 1;
    } else {
      productCountMap[key] = 1;
    }
  }

  // Mengambil produk pertama dari pesanan
  final firstProduct = order.attributes.products.first;
  final key = "${firstProduct.id}_${firstProduct.attributes.sizes.first.size}";

  // Mengembalikan jumlah produk yang memiliki ID dan ukuran yang sama dengan produk pertama
  return productCountMap[key] ?? 0;
}
