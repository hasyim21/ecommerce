import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/brand_bloc/brand_bloc.dart';
import '../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../../blocs/product_bloc/product_bloc.dart';
import '../../../data/models/product.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/product_item.dart';
import 'widgets/brand_list.dart';
import 'widgets/promo_slider.dart';
import 'widgets/cart_button.dart';

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
            Row(
              children: [
                Expanded(
                  child: MyTextFormField(
                    height: 35.0,
                    hintText: 'Cari sepatu',
                    prefixIcon: const Icon(Icons.search),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state.products.isEmpty) {
                      return const CartButton();
                    }

                    return Badge(
                      backgroundColor: Colors.red,
                      offset: Offset(
                          (state.products.length >= 10) ? -6.5 : 0.1, 1.0),
                      label: Text('${state.products.length}'),
                      child: const CartButton(),
                    );
                  },
                ),
              ],
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
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: [
            const PromoSlider(),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'REKOMENDASI',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state.status == ProductStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state.products.isEmpty) {
                        return const Center(
                          child: Text('Produk kosong :('),
                        );
                      }

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.65,
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                        ),
                        itemCount: state.products.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final Product product = state.products[index];
                          return ProductItem(product: product);
                        },
                      );
                    },
                  ),
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
