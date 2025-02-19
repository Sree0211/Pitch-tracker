/* import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/match_model.dart';
import '../models/event_model.dart';

class ApiService {
  static const String baseUrl =
      "http://127.0.0.1:8000"; // Change to production URL when deploying

  // Fetch all matches
  Future<List<Match>> getMatches() async {
    final response = await http.get(Uri.parse('$baseUrl/matches/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((match) => Match.fromJson(match)).toList();
    } else {
      throw Exception('Failed to load matches');
    }
  }

  // Create a new match
  Future<Match> createMatch(Match match) async {
    final response = await http.post(
      Uri.parse('$baseUrl/matches/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(match.toJson()),
    );

    if (response.statusCode == 201) {
      return Match.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create match');
    }
  }

  // Log player event
  Future<void> logPlayerEvent(PlayerEvent event) async {
    final response = await http.post(
      Uri.parse('$baseUrl/player-events/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(event.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to log player event');
    }
  }
}
 */
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000";

  Future<List<dynamic>> fetchMatches() async {
    final response = await http.get(Uri.parse("$baseUrl/matches"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load matches");
    }
  }
}
