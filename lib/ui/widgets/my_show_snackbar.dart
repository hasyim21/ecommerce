import 'package:flutter/material.dart';

myShowSnackBar(BuildContext context, {required String content}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.black,
      content: Text(content),
    ),
  );
}
