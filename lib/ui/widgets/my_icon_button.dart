import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    required this.onTap,
  });

  final IconData icon;
  final double? iconSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
        onTap: onTap,
        child: SizedBox(
          height: 40.0,
          width: 40.0,
          child: Icon(
            icon,
            size: iconSize ?? 24.0,
          ),
        ),
      ),
    );
  }
}
