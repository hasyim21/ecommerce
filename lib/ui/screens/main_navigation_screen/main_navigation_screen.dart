import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../cart_screen/cart_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../transaction_screen/transaction_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          CartScreen(),
          TransactionScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _onTap(index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state.products.isEmpty) {
                  return const Icon(Icons.shopping_cart_outlined);
                }

                return Badge(
                  backgroundColor: Colors.red,
                  offset: const Offset(7.0, -3.5),
                  label: Text('${state.products.length}'),
                  child: const Icon(Icons.shopping_cart_outlined),
                );
              },
            ),
            activeIcon: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state.products.isEmpty) {
                  return const Icon(Icons.shopping_cart);
                }

                return Badge(
                  backgroundColor: Colors.red,
                  offset: const Offset(7.0, -3.5),
                  label: Text('${state.products.length}'),
                  child: const Icon(Icons.shopping_cart),
                );
              },
            ),
            label: 'Keranjang',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'Transaksi',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
