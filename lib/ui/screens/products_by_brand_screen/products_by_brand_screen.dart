import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/checkout_bloc/checkout_bloc.dart';
import '../../../blocs/product_bloc/product_bloc.dart';
import '../../../data/models/brand.dart';
import '../../../data/models/product.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/product_item.dart';
import '../cart_screen/cart_screen.dart';

class ProductsByBrandScreen extends StatefulWidget {
  const ProductsByBrandScreen({
    super.key,
    required this.brand,
  });

  final Brand brand;

  @override
  State<ProductsByBrandScreen> createState() => _ProductsByBrandScreenState();
}

class _ProductsByBrandScreenState extends State<ProductsByBrandScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(
          GetProductsByBrandEvent(category: widget.brand.attributes.name),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
            Text(
              widget.brand.attributes.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state.products.isEmpty) {
                  return MyIconButton(
                    icon: Icons.shopping_cart_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  );
                }

                return Badge(
                  backgroundColor: Colors.red,
                  offset:
                      Offset((state.products.length >= 10) ? -6.5 : 0.1, 1.0),
                  label: Text('${state.products.length}'),
                  child: MyIconButton(
                    icon: Icons.shopping_cart_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.productsByBrand.isEmpty) {
            return const Center(
              child: Text('Produk kosong :('),
            );
          }

          return Container(
            color: Colors.white,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.65,
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: state.productsByBrand.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                Product product = state.productsByBrand[index];
                return ProductItem(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}
