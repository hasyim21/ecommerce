import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserProfileLoading extends StatelessWidget {
  const UserProfileLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: const CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 50.0,
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
                    width: MediaQuery.of(context).size.width / 3.0,
                    height: MediaQuery.of(context).size.height / 75.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
