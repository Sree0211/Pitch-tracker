/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../widgets/possession_timer.dart';
import '../providers/match_provider.dart';
import '../models/event_model.dart'; // Import the event model

class InGameScreen extends StatefulWidget {
  final String matchName;
  final int matchId; // Added matchId as a parameter
  const InGameScreen({
    super.key,
    required this.matchName,
    required this.matchId,
  });

  @override
  _InGameScreenState createState() => _InGameScreenState();
}

class _InGameScreenState extends State<InGameScreen> {
  late MatchProvider matchProvider;
  final ApiService apiService = ApiService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    matchProvider = Provider.of<MatchProvider>(context);
    // Set the matchId when the screen is initialized
    matchProvider.setMatchId(widget.matchId);
  }

  void _startPauseGame() {
    if (matchProvider.isGamePaused) {
      matchProvider.startGame();
    } else {
      matchProvider.pauseGame();
    }
  }

  void _endGame() {
    matchProvider.endGame();
    // Log the final game event when the game ends
    _logPlayerEvent("Game Ended", 0); // Using player number 0 for "Game Ended"
  }

  // Log player event (goal, assist, etc.)
  void _logPlayerEvent(String eventType, int playerNumber) async {
    // Create eventTime string based on match time and added time
    String eventTime =
        '${matchProvider.matchMinute + matchProvider.addedTime}\'';
    if (matchProvider.addedTime > 0) {
      eventTime = '${matchProvider.matchMinute}+${matchProvider.addedTime}\'';
    }

    // Create a PlayerEvent instance
    PlayerEvent event = PlayerEvent(
      matchId: matchProvider.matchId, // matchId from the match provider
      playerNumber: playerNumber,
      eventType: eventType,
      eventTime: eventTime,
    );

    try {
      await apiService.logPlayerEvent(event);
      print('Event logged successfully');
    } catch (e) {
      print('Error logging event: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final matchMinute = matchProvider.matchMinute;
    final addedTime = matchProvider.addedTime;
    final isGamePaused = matchProvider.isGamePaused;
    final gameStatus = matchProvider.gameStatus;

    return Scaffold(
      appBar: AppBar(title: Text("In-Game: ${widget.matchName}")),
      body: Column(
        children: [
          // Displaying match time and status (HT, FT, 90+, etc.)
          Text(
            "Match Time: $matchMinute' + $addedTime' $gameStatus",
            style: const TextStyle(fontSize: 24),
          ),

          // Buttons to control the game
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startPauseGame,
                child: Text(isGamePaused ? "Start Game" : "Pause Game"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _endGame,
                child: const Text("End Game"),
              ),
            ],
          ),

          // Add Possession Timer widget
          const SizedBox(height: 20),
          const PossessionTimer(), // Possession timer widget
          // Example button to log a goal
          ElevatedButton(
            onPressed:
                () => _logPlayerEvent(
                  "Goal",
                  7,
                ), // Example goal event for player 7
            child: const Text("Log Goal Event"),
          ),
        ],
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';

class InGameScreen extends StatelessWidget {
  const InGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("In-Game Tracker")),
      body: const Center(child: Text("Track live match events here")),
    );
  }
}
