import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/order_bloc/order_bloc.dart';
import '../../../../data/models/order/list_order_response.dart';
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

        // ignore: prefer_is_empty
        if (state.listOrders?.data?.length == 0) {
          return const Center(
            child: Text('Wah, transaksimu kosong :('),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: state.listOrders?.data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final Order order = state.listOrders!.data![index];
            return TransactionItem(order: order);
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
