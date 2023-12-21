import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandListLoading extends StatelessWidget {
  const BrandListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey.shade200,
                ),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  color: Colors.grey,
                  height: 40.0,
                  width: 60.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                color: Colors.grey,
                height: 12.0,
                width: 60.0,
              ),
            )
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8.0,
        );
      },
    );
  }
}
