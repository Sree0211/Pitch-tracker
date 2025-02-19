import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/match_provider.dart';
import '../models/match_model.dart';

class MatchdayTrackerScreen extends StatelessWidget {
  const MatchdayTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Matchday Tracker")),
      body: Consumer<MatchProvider>(
        builder: (context, matchProvider, child) {
          if (matchProvider.matches.isEmpty) {
            return const Center(
              child: Text("No matches available. Add a new match!"),
            );
          }
          return ListView.builder(
            itemCount: matchProvider.matches.length,
            itemBuilder: (context, index) {
              MatchModel match = matchProvider.matches[index];
              return ListTile(
                title: Text(match.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date: ${match.date}"),
                    Text("Opponent: ${match.opponent}"),
                    Text("Formation: ${match.formation}"),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => matchProvider.deleteMatch(match.id!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMatchDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddMatchDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController opponentController = TextEditingController();
    final TextEditingController formationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Match"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Match Name"),
              ),
              TextField(
                controller: opponentController,
                decoration: const InputDecoration(hintText: "Opponent"),
              ),
              TextField(
                controller: formationController,
                decoration: const InputDecoration(hintText: "Formation"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    opponentController.text.isNotEmpty &&
                    formationController.text.isNotEmpty) {
                  Provider.of<MatchProvider>(context, listen: false).addMatch(
                    nameController.text,
                    opponentController.text,
                    formationController.text,
                  );
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
