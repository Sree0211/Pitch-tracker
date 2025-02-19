/* class PlayerEvent {
  final int matchId;
  final int playerNumber;
  final String eventType;
  final String eventTime;

  PlayerEvent({
    required this.matchId,
    required this.playerNumber,
    required this.eventType,
    required this.eventTime,
  });

  // Method to convert PlayerEvent to JSON
  Map<String, dynamic> toJson() {
    return {
      'match_id': matchId,
      'player_number': playerNumber,
      'event_type': eventType,
      'event_time': eventTime,
    };
  }

  // Method to create a PlayerEvent from JSON
  factory PlayerEvent.fromJson(Map<String, dynamic> json) {
    return PlayerEvent(
      matchId: json['match_id'],
      playerNumber: json['player_number'],
      eventType: json['event_type'],
      eventTime: json['event_time'],
    );
  }
}
 */
class EventModel {
  final int id;
  final String type;
  final String timestamp;

  EventModel({required this.id, required this.type, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {'id': id, 'type': type, 'timestamp': timestamp};
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      type: map['type'],
      timestamp: map['timestamp'],
    );
  }
}
