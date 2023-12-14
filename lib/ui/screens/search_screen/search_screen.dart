import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/product_bloc/product_bloc.dart';
import '../../../data/models/product.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/product_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ClearSearchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            MyIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: MyTextFormField(
                height: 35.0,
                hintText: 'Cari sepatu',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: InkWell(
                  child: const Icon(Icons.clear),
                  onTap: () => context.read<ProductBloc>().add(
                        ClearSearchProductsEvent(),
                      ),
                ),
                onFieldSubmitted: (value) {
                  context.read<ProductBloc>().add(
                        SearchProductsEvent(name: value),
                      );
                },
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.initial) {
            return const SizedBox();
          }
          if (state.status == ProductStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.searchProducts.isEmpty) {
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
              itemCount: state.searchProducts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                Product product = state.searchProducts[index];
                return ProductItem(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}
