import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';

/// A widget that displays a mission timer with customizable styles.
class MissionTimer extends StatefulWidget {
  /// Creates a `MissionTimer` widget.
  ///
  /// [endTime] is the mission's end time. If not provided,
  /// it is set to 5 minutes after the current time.
  ///
  /// [timeTextStyle] is the text style for displaying the remaining time in the timer.
  ///
  /// [colonsTextStyle] is the text style for the colons in the timer.
  ///
  /// [descriptionTextStyle] is the text style for the optional description in the timer.
  const MissionTimer({
    super.key,
    this.endTime,
    this.timeTextStyle,
    this.colonsTextStyle,
    this.descriptionTextStyle,
  });

  /// The mission's end time.
  final DateTime? endTime;

  /// Text style for displaying the remaining time in the timer.
  final TextStyle? timeTextStyle;

  /// Text style for the colons in the timer.
  final TextStyle? colonsTextStyle;

  /// Text style for the optional description in the timer.
  final TextStyle? descriptionTextStyle;

  @override
  State<MissionTimer> createState() => _MissionTimerState();
}

class _MissionTimerState extends State<MissionTimer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Mission Timer',
          style: GoogleFonts.exo2(
            fontSize: (size.width < 1920) ? 12 : 18.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 215, 252, 251),
          ),
        ),
        TimerCountdown(
          endTime: widget.endTime ?? DateTime.now().add(const Duration(minutes: 5)),
          enableDescriptions: false,
          timeTextStyle: widget.timeTextStyle ?? GoogleFonts.exo(
            color: Colors.white,
            fontSize: (size.width < 1920) ? 15 : 23.0,
          ),
          colonsTextStyle: widget.colonsTextStyle ?? GoogleFonts.exo(
            color: Colors.white,
            fontSize: (size.width < 1920) ? 15 : 23.0,
          ),
          descriptionTextStyle: widget.descriptionTextStyle ?? GoogleFonts.exo(
            color: Colors.white,
            fontSize: (size.width < 1920) ? 15 : 20.0,
          ),
        ),
      ],
    );
  }
}
