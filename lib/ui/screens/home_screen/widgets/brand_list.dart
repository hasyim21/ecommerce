import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/brand_bloc/brand_bloc.dart';
import '../../../../constants/constants.dart';
import '../../../../data/models/brand.dart';
import '../../products_by_brand_screen/products_by_brand_screen.dart';

class BrandList extends StatelessWidget {
  const BrandList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: BlocBuilder<BrandBloc, BrandState>(
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.brands.length,
            itemBuilder: (BuildContext context, int index) {
              final Brand brand = state.brands[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsByBrandScreen(brand: brand),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.0,
                      width: 60.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        ),
                      ),
                      child: Image.network(
                        '$baseUrl${brand.attributes.image}',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      brand.attributes.name,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8.0,
              );
            },
          );
        },
      ),
    );
  }
}
