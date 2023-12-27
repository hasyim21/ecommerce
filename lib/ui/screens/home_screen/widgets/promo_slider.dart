import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../blocs/promo_bloc/promo_bloc.dart';
import '../../../../constants/constants.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoBloc, PromoState>(
      builder: (context, state) {
        if (state.status == PromoStatus.loading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: AspectRatio(
              aspectRatio: 3.33,
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          );
        }

        return Column(
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                aspectRatio: 3.33,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) {
                  _currentIndex = index;
                  setState(() {});
                },
              ),
              items: state.promos.map((promo) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: '$baseUrl${promo.attributes.image}',
                        errorWidget: (context, url, error) => AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: Colors.grey.shade200,
                            child: Image.asset(
                              "assets/images/no_image.png",
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.promos.asMap().entries.map(
                (entry) {
                  return Container(
                    width: 24.0,
                    height: 4.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 2.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: (entry.key == _currentIndex)
                          ? Colors.black
                          : Colors.grey.shade300,
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}
