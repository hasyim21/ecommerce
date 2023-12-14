import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Icon(
                icon,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(title),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
