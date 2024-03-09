import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

/// A widget that displays a carousel of images.
class ImageCarousel extends StatelessWidget {
  /// Creates an `ImageCarousel` widget.
  ///
  /// [images] is a list of image paths to display in the carousel.
  /// [carouselOptions] is an optional parameter to customize the behavior of the carousel.
  const ImageCarousel({
    super.key,
    required this.images,
    this.carouselOptions,
  });

  /// List of image paths to display in the carousel.
  final List<String> images;

  /// Optional parameter to customize the behavior of the carousel.
  final CarouselOptions? carouselOptions;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Image.asset(
          images[index],
          width: MediaQuery.of(context).size.width * 0.08, // 10% of the screen
        );
      },
      options: carouselOptions ??
          CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.linearToEaseOut,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
    );
  }
}

