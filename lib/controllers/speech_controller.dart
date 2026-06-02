import 'package:get/get.dart';
import '../services/speech_service.dart';

class SpeechController extends GetxController {
  final SpeechService _speechService = SpeechService();
  
  var recognizedText = 'Press the button and start speaking'.obs;
  var isListening = false.obs;

  void toggleListening() async {
    if (isListening.value) {
      _speechService.stopListening();
      isListening.value = false;
    } else {
      bool available = await _speechService.initialize();
      if (available) {
        isListening.value = true;
        _speechService.startListening((text) {
          recognizedText.value = text;
        });
      } else {
        Get.snackbar('Error', 'Speech recognition not available');
      }
    }
  }
}
