import 'package:flutter/material.dart';

import 'widgets/payment_dialog.dart';

class PaymentFailedScreen extends StatefulWidget {
  const PaymentFailedScreen({super.key});

  @override
  State<PaymentFailedScreen> createState() => _PaymentFailedScreenState();
}

class _PaymentFailedScreenState extends State<PaymentFailedScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await paymentDialog(context,
          icon: Icons.close,
          title: 'Gagal',
          content: 'Pembayaran gagal dilakukan');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
