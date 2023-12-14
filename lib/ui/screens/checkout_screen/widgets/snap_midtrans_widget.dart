import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../payment_screen/payment_failed_screen.dart';
import '../../payment_screen/payment_success_screen.dart';

class SnapMidtransWidget extends StatefulWidget {
  const SnapMidtransWidget({super.key, required this.url});

  final String url;

  @override
  State<SnapMidtransWidget> createState() => _SnapMidtransWidgetState();
}

class _SnapMidtransWidgetState extends State<SnapMidtransWidget> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            if (url.contains('status_code=202&transaction_status=deny')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentFailedScreen()),
              );
            }
            if (url.contains('status_code=200&transaction_status=settlement')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentSuccessScreen()),
              );
              context.read<CheckoutBloc>().add(ClearCartEvent());
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller!),
    );
  }
}
