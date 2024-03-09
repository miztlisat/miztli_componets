import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

/// An enumeration representing different sides for applying padding.
enum PaddingSide {
  /// Padding on the right side.
  right,

  /// Padding on the left side.
  left,

  /// Padding on the top side.
  top,

  /// Padding on the bottom side.
  bottom,
}

class GlassContainerMiztli extends StatelessWidget {
  /// A customizable glass-like container widget.
  ///
  /// [child] is the widget placed inside the container.
  ///
  /// [flex] is the flex factor used by the Expanded widget.
  ///
  /// [paddings] is a list of [PaddingSide] enum values indicating which
  /// sides of the container to apply padding to.
  ///
  /// [environment] determines the environment type, such as 'development'.
  ///
  /// [containerColor] is the background color of the container.
  ///
  /// [containerGradient] is the gradient used as the background of the container.
  ///
  /// [borderGradient] is the gradient used for the container border.
  ///
  /// [elevation] is the elevation of the container shadow.
  ///
  /// [maxHeight] is the maximum height of the container.
  ///
  /// [maxWidth] is the maximum width of the container.
  const GlassContainerMiztli({
    super.key,
    required this.child,
    required this.flex,
    this.paddings = const <PaddingSide>[],
    this.environment = 'development',
    this.containerColor = Colors.blue,
    this.containerGradient,
    this.borderGradient,
    this.elevation = 3.0,
    this.maxHeight = double.infinity,
    this.maxWidth = double.infinity,
  });

  final Widget child;
  final int flex;
  final List<PaddingSide> paddings;
  final String environment;
  final Color containerColor;
  final Gradient? containerGradient;
  final Gradient? borderGradient;
  final double elevation;
  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: calculateEdgeInsets(paddings),
        child: environment != 'development'
            ? GlassContainer(
                gradient: containerGradient ??
                    LinearGradient(
                      colors: <Color>[
                        Colors.white.withOpacity(0.40),
                        Colors.white.withOpacity(0.10),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                borderGradient: borderGradient ??
                    LinearGradient(
                      colors: <Color>[
                        Colors.white.withOpacity(0.60),
                        Colors.white.withOpacity(0.10),
                        Colors.lightBlueAccent.withOpacity(0.05),
                        Colors.lightBlueAccent.withOpacity(0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const <double>[0.0, 0.39, 0.40, 1.0],
                    ),
                color: containerColor,
                elevation: elevation,
                height: maxHeight,
                width: maxWidth,
                child: child,
              )
            : ColoredBox(
                color: containerColor,
                child: child,
              ),
      ),
    );
  }

  /// Calculates the edge insets based on the provided list of padding sides.
  ///
  /// [paddings] is a list of PaddingSide enum values indicating which sides
  /// should have padding applied.
  ///
  /// Returns EdgeInsets representing the calculated padding.
  EdgeInsets calculateEdgeInsets(List<PaddingSide> paddings) {
    return EdgeInsets.only(
      right: paddings.contains(PaddingSide.right) ? 10 : 0,
      left: paddings.contains(PaddingSide.left) ? 10 : 0,
      top: paddings.contains(PaddingSide.top) ? 10 : 0,
      bottom: paddings.contains(PaddingSide.bottom) ? 10 : 0,
    );
  }
}
