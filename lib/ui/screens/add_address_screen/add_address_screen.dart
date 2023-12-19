import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user_bloc/user_bloc.dart';
import '../../../data/models/user.dart';
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_text_form_field.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _subdistrictController = TextEditingController();
  final TextEditingController _regencyController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _otherDetailsController = TextEditingController();

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
              'Alamat Baru',
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
          const Text(
            'Kontak',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          MyTextFormField(
            controller: _fullnameController,
            hintText: 'Nama Lengkap',
          ),
          const SizedBox(
            height: 8.0,
          ),
          MyTextFormField(
            controller: _phoneNumberController,
            hintText: 'No Telepon',
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            'Alamat',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          MyTextFormField(
            controller: _subdistrictController,
            hintText: 'Kecamatan',
          ),
          const SizedBox(
            height: 8.0,
          ),
          MyTextFormField(
            controller: _regencyController,
            hintText: 'Kabupaten',
          ),
          const SizedBox(
            height: 8.0,
          ),
          MyTextFormField(
            controller: _provinceController,
            hintText: 'Provinsi',
          ),
          const SizedBox(
            height: 8.0,
          ),
          MyTextFormField(
            controller: _postalCodeController,
            hintText: 'Kode Pos',
          ),
          const SizedBox(
            height: 8.0,
          ),
          MyTextFormField(
            controller: _otherDetailsController,
            hintText: 'Detail Lainnya (Cth: Blok/ Unit No. , Patokan)',
          ),
          const SizedBox(
            height: 24.0,
          ),
          MyElevatedButton(
            title: 'Simpan',
            onPressed: () {
              context.read<UserBloc>().add(
                    UpdateAddressEvent(
                      address: Address(
                          fullName: _fullnameController.text,
                          phoneNumber: _phoneNumberController.text,
                          subdistrict: _subdistrictController.text,
                          regency: _regencyController.text,
                          province: _provinceController.text,
                          postalCode: _postalCodeController.text,
                          otherDetails: _otherDetailsController.text),
                    ),
                  );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
