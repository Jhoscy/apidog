import 'package:flutter/material.dart';

class CarouselIndicators extends StatelessWidget {
  const CarouselIndicators({
    super.key,
    required this.imagesLength,
    required this.currentIndex,
  });

  final int imagesLength;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(imagesLength, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentIndex == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
