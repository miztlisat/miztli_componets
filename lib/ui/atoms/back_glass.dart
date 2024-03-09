import 'dart:ui';

import 'package:flutter/material.dart';

class BlackGlass extends StatelessWidget {
  /// A customizable black glass-like container widget.
  ///
  /// [width] is the width of the container.
  ///
  /// [height] is the height of the container.
  ///
  /// [child] is the widget placed inside the container.
  ///
  /// [mainColor] is the primary color used in the gradient of the container. Default is black.
  ///
  /// [secondaryColor] is the secondary color used in the gradient of the container. Default is dark grey.
  const BlackGlass({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.mainColor = Colors.black,
    this.secondaryColor = Colors.grey,
  });

  final double width;
  final double height;
  final Widget child;
  final Color mainColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.6),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.15)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[mainColor, secondaryColor],
                ),
              ),
            ),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
