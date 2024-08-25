import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animated_analog_clock/animated_analog_clock.dart';

import '../common/glasmorphic_container.dart';

class GlassmorphicClockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Analog Clock
        Stack(
          children: [
            AnimatedAnalogClock(
              size: 180,
              backgroundColor: Colors.transparent,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              secondHandColor: Colors.redAccent,
              centerDotColor: Colors.redAccent,
              hourDashColor: Colors.white,
              minuteDashColor: Colors.grey,
            ),
            //Positioned(top: 50, left: 50, right: 50, child: DigitalClock()),
          ],
        ),
      ],
    );
  }
}

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late String _formattedTime;

  @override
  void initState() {
    super.initState();
    _formattedTime = _formatCurrentTime();
    _updateTime();
  }

  void _updateTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _formattedTime = _formatCurrentTime();
      });
    });
  }

  String _formatCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12
        ? now.hour - 12
        : now.hour == 0
            ? 12
            : now.hour;
    final minute = _formatDigits(now.minute);
    final second = _formatDigits(now.second);
    final period = now.hour >= 12 ? "PM" : "AM";
    return "$hour:$minute:$second $period";
  }

  String _formatDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
