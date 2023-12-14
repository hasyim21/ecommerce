import 'package:flutter/material.dart';

import '../../../widgets/my_elevated_button.dart';
import '../../main_navigation_screen/main_navigation_screen.dart';

paymentDialog(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String content,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Icon(
                icon,
                size: 80.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(content),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: MyElevatedButton(
                  title: 'OK',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainNavigationScreen()),
                        (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
