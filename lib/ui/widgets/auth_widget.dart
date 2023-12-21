import 'package:flutter/material.dart';

import 'my_elevated_button.dart';
import '../screens/auth_screen/login_auth_screen.dart';
import '../screens/auth_screen/register_auth_screen.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person_outline,
                size: 40.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Hi,Fam!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'Eksplor lebih banyak sepatu yang keren di SNKRS dengan daftar atau masuk ke akunmu',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: MyElevatedButton(
                    title: 'Masuk',
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginAuthScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: MyElevatedButton(
                    title: 'Daftar',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterAuthScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
