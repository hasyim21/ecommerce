import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../widgets/my_divider.dart';
import '../../widgets/auth_widget.dart';
import '../address_screen/address_screen.dart';
import 'widgets/menu_profile.dart';
import 'widgets/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return ListView(
              children: [
                const UserProfile(),
                const MyDivider(height: 4.0),
                MenuProfile(
                  icon: Icons.location_on_outlined,
                  title: 'Alamat Pengiriman',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddressScreen(),
                      ),
                    );
                  },
                ),
                const MyDivider(height: 4.0),
                MenuProfile(
                  icon: Icons.logout_outlined,
                  title: 'Keluar',
                  onTap: () {
                    context.read<AuthBloc>().add(LoggedOut());
                    context.read<CheckoutBloc>().add(ClearCartEvent());
                  },
                ),
                MyDivider(
                  height: 1.0,
                  color: Colors.grey.shade300,
                ),
              ],
            );
          }
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const AuthWidget();
        },
      ),
    );
  }
}
