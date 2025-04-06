import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key, 
    required this.images,
    this.onPageChanged,
  });

  final List<String> images;
  final Function(int)? onPageChanged;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.images.length,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            activePage = page;
          });
          widget.onPageChanged?.call(page);
        },
        itemBuilder: (context, pagePosition) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: widget.images[pagePosition],
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
                ),
              ),
            ),
          );
        });
  }
}
