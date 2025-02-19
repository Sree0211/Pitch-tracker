/* import 'package:flutter/material.dart';

class MatchTimer extends StatefulWidget {
  const MatchTimer({super.key});

  @override
  _MatchTimerState createState() => _MatchTimerState();
}

class _MatchTimerState extends State<MatchTimer> {
  int matchMinute = 0;
  int addedTime = 0;

  void _incrementMinute() {
    setState(() {
      matchMinute++;
    });
  }

  void _incrementAddedTime() {
    setState(() {
      addedTime++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Match Time: $matchMinute + $addedTime'",
          style: TextStyle(fontSize: 24),
        ),
        ElevatedButton(
          onPressed: _incrementMinute,
          child: Text("Increment Minute"),
        ),
        ElevatedButton(
          onPressed: _incrementAddedTime,
          child: Text("Increment Added Time"),
        ),
      ],
    );
  }
}
 */
import 'dart:async';
import 'package:flutter/material.dart';

class MatchTimer extends StatefulWidget {
  const MatchTimer({super.key});

  @override
  _MatchTimerState createState() => _MatchTimerState();
}

class _MatchTimerState extends State<MatchTimer> {
  int _seconds = 0;
  bool _isRunning = false;
  Timer? _timer;

  void _startStopTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() => _seconds++);
      });
    }
    setState(() => _isRunning = !_isRunning);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Match Time: ${_seconds ~/ 60}:${_seconds % 60}"),
        ElevatedButton(
          onPressed: _startStopTimer,
          child: Text(_isRunning ? "Pause" : "Start"),
        ),
      ],
    );
  }
}
