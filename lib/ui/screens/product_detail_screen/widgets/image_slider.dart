import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/product.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            aspectRatio: 1,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentIndex = index;
              setState(() {});
            },
          ),
          items: widget.product.attributes.images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  color: Colors.grey.shade200,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: '$baseUrl$imageUrl',
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
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.product.attributes.images.asMap().entries.map(
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
  }
}
