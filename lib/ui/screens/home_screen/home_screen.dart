import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/brand_bloc/brand_bloc.dart';
import '../../../blocs/product_bloc/product_bloc.dart';
import '../../../blocs/promo_bloc/promo_bloc.dart';
import '../../widgets/my_text_form_field.dart';
import '../search_screen/search_screen.dart';
import 'widgets/brand_list.dart';
import 'widgets/product_list.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductsEvent());
    context.read<BrandBloc>().add(GetBrandsEvent());
    context.read<PromoBloc>().add(GetPromosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 127.0,
        shape: const Border(bottom: BorderSide.none),
        title: Column(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: MyTextFormField(
                enabled: false,
                height: 35.0,
                hintText: 'Cari sepatu',
                prefixIcon: const Icon(Icons.search),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const BrandList(),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductBloc>().add(GetProductsEvent());
          context.read<BrandBloc>().add(GetBrandsEvent());
          context.read<PromoBloc>().add(GetPromosEvent());
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: [
            const PromoSlider(),
            Container(
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REKOMENDASI',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  ProductList(),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
