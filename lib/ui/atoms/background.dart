import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  /// A widget to display a background image with content on top.
  ///
  /// [child] is the widget placed on top of the background image.
  ///
  /// [img] is the path of the background image asset.
  const BackgroundWidget({
    super.key,
    required this.child,
    required this.img,
  });

  final Widget child;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
