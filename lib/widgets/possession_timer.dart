/* import 'package:flutter/material.dart';
import 'dart:async';

class PossessionTimer extends StatefulWidget {
  const PossessionTimer({super.key});

  @override
  _PossessionTimerState createState() => _PossessionTimerState();
}

class _PossessionTimerState extends State<PossessionTimer> {
  bool _isTeamA = true; // Track if Team A has possession
  int _teamASeconds = 0; // Possession time for Team A
  int _teamBSeconds = 0; // Possession time for Team B
  int _totalSeconds = 0; // Total game time (in seconds)

  Timer? _timer; // Timer for tracking possession

  // Function to switch possession between teams
  void _switchPossession() {
    setState(() {
      _isTeamA = !_isTeamA; // Switch possession
      if (_isTeamA) {
        _startTeamA();
      } else {
        _startTeamB();
      }
    });
  }

  // Start Team A's possession timer
  void _startTeamA() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _teamASeconds++;
        _totalSeconds++;
      });
    });
  }

  // Start Team B's possession timer
  void _startTeamB() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _teamBSeconds++;
        _totalSeconds++;
      });
    });
  }

  // Stop the timer for both teams
  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double teamAPossessionPercentage =
        _totalSeconds == 0 ? 0 : (_teamASeconds / _totalSeconds) * 100;
    double teamBPossessionPercentage =
        _totalSeconds == 0 ? 0 : (_teamBSeconds / _totalSeconds) * 100;

    return Column(
      children: [
        // Team A possession display
        Text(
          "Team A Possession: $_teamASeconds seconds",
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          "Team A Possession Percentage: ${teamAPossessionPercentage.toStringAsFixed(2)}%",
          style: const TextStyle(fontSize: 18),
        ),

        // Team B possession display
        Text(
          "Team B Possession: $_teamBSeconds seconds",
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          "Team B Possession Percentage: ${teamBPossessionPercentage.toStringAsFixed(2)}%",
          style: const TextStyle(fontSize: 18),
        ),

        // Button to switch possession
        ElevatedButton(
          onPressed: _switchPossession,
          child: Text(_isTeamA ? "Switch to Team B" : "Switch to Team A"),
        ),

        // Button to stop the timer (you can also pause or stop manually if needed)
        ElevatedButton(onPressed: _stopTimer, child: const Text("Stop Timer")),
      ],
    );
  }
}
 */
import 'dart:async';
import 'package:flutter/material.dart';

class PossessionTimer extends StatefulWidget {
  const PossessionTimer({super.key});

  @override
  _PossessionTimerState createState() => _PossessionTimerState();
}

class _PossessionTimerState extends State<PossessionTimer> {
  int _team1Seconds = 0;
  int _team2Seconds = 0;
  bool _isTeam1 = true;
  Timer? _timer;

  void _togglePossession() {
    _isTeam1 = !_isTeam1;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_isTeam1) {
          _team1Seconds++;
        } else {
          _team2Seconds++;
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Team 1 Possession: ${_team1Seconds}s"),
        Text("Team 2 Possession: ${_team2Seconds}s"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _startTimer, child: const Text("Start")),
            ElevatedButton(onPressed: _stopTimer, child: const Text("Stop")),
            ElevatedButton(
              onPressed: _togglePossession,
              child: const Text("Switch Team"),
            ),
          ],
        ),
      ],
    );
  }
}
