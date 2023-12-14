import 'package:flutter/material.dart';

import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_text_form_field.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
            const Text(
              'Alamat Pengiriman',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40.0,
              width: 40.0,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LeBron James | 08123456789',
                style: TextStyle(),
              ),
              Text(
                'Los Angeles, California, 666',
                style: TextStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          MyTextFormField(
            height: 140.0,
            maxLines: 5,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          MyElevatedButton(
            title: 'Simpan',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
