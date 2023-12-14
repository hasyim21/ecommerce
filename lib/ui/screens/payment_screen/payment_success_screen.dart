import 'package:flutter/material.dart';

import 'widgets/payment_dialog.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await paymentDialog(context,
          icon: Icons.check,
          title: 'Berhasil',
          content: 'Pembayaran berhasil dilakukan');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
