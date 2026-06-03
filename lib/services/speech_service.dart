import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText speech = SpeechToText();

  Future<bool> initialize() async {
    return await speech.initialize();
  }

  void startListening(Function(String) onResult) {
    speech.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
  }

  void stopListening() {
    speech.stop();
  }
}
