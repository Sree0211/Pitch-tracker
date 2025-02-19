/* import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceProcessing {
  late stt.SpeechToText _speech;
  bool _isListening = false;

  VoiceProcessing() {
    _speech = stt.SpeechToText();
  }

  Future<void> startListening(Function(String) onResult) async {
    _isListening = await _speech.initialize();
    if (_isListening) {
      _speech.listen(onResult: (result) => onResult(result.recognizedWords));
    }
  }

  void stopListening() {
    _speech.stop();
  }
}
 */
import 'package:speech_to_text/speech_to_text.dart';

class VoiceProcessingService {
  final SpeechToText _speech = SpeechToText();

  Future<void> initialize() async {
    await _speech.initialize();
  }

  Future<String> startListening() async {
    if (!_speech.isAvailable) return "Speech recognition unavailable.";
    _speech.listen();
    return "Listening...";
  }

  void stopListening() {
    _speech.stop();
  }
}
