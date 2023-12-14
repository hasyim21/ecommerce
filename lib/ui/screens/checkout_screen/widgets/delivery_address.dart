import 'package:flutter/material.dart';

import '../../../widgets/my_icon_button.dart';
import '../../address_screen/address_screen.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text('Alamat Pengiriman'),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LeBron James | 08123456789',
                    style: TextStyle(
                      fontSize: 12.5,
                    ),
                  ),
                  Text(
                    'Los Angeles, California, 666',
                    style: TextStyle(
                      fontSize: 12.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              MyIconButton(
                icon: Icons.arrow_forward_ios,
                iconSize: 15.0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddressScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
