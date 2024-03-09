import 'package:flutter/material.dart';
import "package:flutter_svg/svg.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:miztli_componets/domain/models/state_mission.dart';

/// A widget representing a mission state.
class StateMissionWidget extends StatelessWidget {
  /// Creates a `StateMissionWidget`.
  ///
  /// [stateMission] is the state model associated with the widget.
  /// [style] is an optional parameter for customizing the text style.
  const StateMissionWidget({
    super.key,
    required this.stateMission,
    this.style,
  });

  /// The state model associated with the widget.
  final StateMissionModel stateMission;

  /// Optional text style for the state name.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(stateMission
            .getIcon()), // Display the icon corresponding to the state
        Text(
          stateMission.name, // Display the name of the state
          style: style ??
              GoogleFonts.exo(
                // Apply custom or default text style
                color: Colors.white,
                fontSize: size.height / 80,
              ),
        ),
      ],
    );
  }
}
