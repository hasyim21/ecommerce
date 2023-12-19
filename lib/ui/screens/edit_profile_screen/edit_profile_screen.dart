import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user_bloc/user_bloc.dart';
import '../../../data/models/user.dart';
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  final User user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullnameController.text = widget.user.fullName ?? '-';
    _usernameController.text = widget.user.username;
    _emailController.text = widget.user.email;
    _phoneNumberController.text = widget.user.phoneNumber ?? '-';
  }

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
              'Ubah Profil',
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
          const SizedBox(
            height: 16.0,
          ),
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
              "https://i.ibb.co/PGv8ZzG/me.jpg",
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          const Text(
            'Nama Lengkap',
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
          const Text(
            'Username',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          MyTextFormField(
            controller: _usernameController,
            hintText: 'Username',
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            'Email',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          MyTextFormField(
            controller: _emailController,
            hintText: 'Email',
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            'No Telepon',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          MyTextFormField(
            controller: _phoneNumberController,
            hintText: 'No Telepon',
          ),
          const SizedBox(
            height: 24.0,
          ),
          MyElevatedButton(
            title: 'Simpan',
            onPressed: () {
              context.read<UserBloc>().add(UpdateProfileEvent(
                    fullName: _fullnameController.text,
                    username: _usernameController.text,
                    email: _emailController.text,
                    phoneNumber: _phoneNumberController.text,
                  ));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
