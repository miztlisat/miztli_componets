import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miztli_componets/ui/molecules/mission_count_down.dart';

/// A widget that displays the mission title along with the team number and a timer.
class MissionTitle extends StatelessWidget {
  /// Creates a `MissionTitle` widget.
  ///
  /// [teamNumber] is the team number associated with the mission.
  /// [style] is the optional text style for the mission title.
  const MissionTitle({
    super.key,
    required this.teamNumber,
    this.style,
  });

  /// The team number associated with the mission.
  final int teamNumber;

  /// Optional text style for the mission title.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            'Team Number: $teamNumber', // Uses the provided team number.
            style: style ?? GoogleFonts.exo(
              fontSize: (size.width < 1920) ? 20 : 30.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 215, 252, 251),
            ),
          ),
        ),
        const MissionTimer(), // Displays the mission timer.
      ],
    );
  }
}
