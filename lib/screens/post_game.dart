import 'package:flutter/material.dart';

class PostGameScreen extends StatelessWidget {
  const PostGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post-Game Analysis")),
      body: const Center(child: Text("Analyze match stats here")),
    );
  }
}
