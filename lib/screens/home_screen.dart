import 'package:flutter/material.dart';
import 'matchday_tracker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //
          Image.asset("assets/images/images.jpg", fit: BoxFit.cover),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  context,
                  "Matchday Tracker",
                  const MatchdayTrackerScreen(),
                ),
                _buildButton(
                  context,
                  "Training Tracker",
                  null,
                ), // To be implemented
                _buildButton(context, "Manual", null),
                _buildButton(context, "License", null),
                _buildButton(context, "Login", null),
                _buildButton(context, "Quit", null),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, Widget? screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
        onPressed:
            screen != null
                ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screen),
                )
                : null,
        child: Text(label),
      ),
    );
  }
}
