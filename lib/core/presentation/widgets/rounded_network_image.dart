import 'package:flutter/material.dart';

class RoundedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final double? width;
  final double? height;

  const RoundedNetworkImage({
    required this.imageUrl,
    this.radius = 8,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return const SizedBox();
        },
      ),
    );
  }
}
