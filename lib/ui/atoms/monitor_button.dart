import 'package:flutter/material.dart';

/// A button with a monitor-like appearance that responds to tap gestures.
class MonitorButton extends StatefulWidget {
  /// Creates a monitor-like button.
  ///
  /// The [text] and [icon] parameters are required.
  ///
  /// The [primaryColor] defines the primary color used in the button's gradient.
  ///
  /// The [secondaryColor] defines the secondary color used in the button's gradient.
  ///
  /// The [style] parameter is optional and defines the text style of the button text.
  /// 
  /// Example usage of the [MonitorButton] widget.
  ///
  /// ```dart
  /// void main() {
  ///   runApp(MaterialApp(
  ///     home: Scaffold(
  ///       appBar: AppBar(
  ///         title: Text('Monitor Button Example'),
  ///       ),
  ///       body: Center(
  ///         child: MonitorButton(
  ///           text: 'Press Me!',
  ///           icon: Icon(Icons.monitor),
  ///           style: TextStyle(
  ///             color: Colors.white,
  ///             fontSize: 16,
  ///           ),
  ///         ),
  ///       ),
  ///     ),
  ///   ));
  /// }
  /// ```
  ///
  const MonitorButton({
    super.key,
    this.primaryColor = Colors.amber,
    this.secondaryColor = Colors.blueGrey,
    required this.text,
    required this.icon,
    this.style,
  });

  /// The text displayed on the button.
  final String text;

  /// The icon displayed on the button.
  final Icon icon;

  /// The primary color used in the button's gradient.
  final Color primaryColor;

  /// The secondary color used in the button's gradient.
  final Color secondaryColor;

  /// The text style of the button text.
  ///
  /// If not provided, a default style will be used.
  final TextStyle? style;

  @override
  MonitorButtonState createState() => MonitorButtonState();
}

class MonitorButtonState extends State<MonitorButton> {
  bool glowing = false;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    // On mobile devices, gesture detector is perfect
    // However for desktop and web we can show this effect on hover too
    return GestureDetector(
      onTapUp: (TapUpDetails val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapDown: (TapDownDetails val) {
        setState(() {
          glowing = true;
          scale = 1.15;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()
          ..translate(glowing ? -10.0 : 0.0, glowing ? -5.0 : 0.0)
          ..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 80,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: <Color>[
              widget.primaryColor,
              widget.secondaryColor,
            ],
          ),
          boxShadow: glowing
              ? <BoxShadow>[
                  BoxShadow(
                    color: widget.primaryColor.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 16,
                    offset: const Offset(-8, 0),
                  ),
                  BoxShadow(
                    color: widget.secondaryColor.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 16,
                    offset: const Offset(8, 0),
                  ),
                  BoxShadow(
                    color: widget.primaryColor.withOpacity(0.2),
                    spreadRadius: 16,
                    blurRadius: 32,
                    offset: const Offset(-8, 0),
                  ),
                  BoxShadow(
                    color: widget.secondaryColor.withOpacity(0.2),
                    spreadRadius: 16,
                    blurRadius: 32,
                    offset: const Offset(8, 0),
                  ),
                ]
              : <BoxShadow>[],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.text,
              style: widget.style ??
                  const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 239, 250, 234),
                  ),
            ),
            widget.icon,
          ],
        ),
      ),
    );
  }
}