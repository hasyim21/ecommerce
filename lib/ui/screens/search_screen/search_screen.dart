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
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ClearSearchProductsEvent());
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
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
                controller: _searchController,
                focusNode: _searchFocusNode,
                height: 35.0,
                hintText: 'Cari sepatu',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: InkWell(
                  child: const Icon(Icons.clear),
                  onTap: () {
                    _searchController.clear();
                    context.read<ProductBloc>().add(
                          ClearSearchProductsEvent(),
                        );
                  },
                ),
                onFieldSubmitted: (value) {
                  _searchController.text = value;
                  context.read<ProductBloc>().add(
                        SearchProductsEvent(name: _searchController.text),
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
