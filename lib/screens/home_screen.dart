import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/speech_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SpeechController controller = Get.put(SpeechController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Echo See'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                controller.isListening.value 
                  ? 'Listening...' 
                  : 'Tap the mic to start',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              )),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Obx(() => Text(
                      controller.recognizedText.value,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => FloatingActionButton(
        onPressed: controller.toggleListening,
        backgroundColor: controller.isListening.value ? Colors.red : Colors.deepPurple,
        child: Icon(
          controller.isListening.value ? Icons.stop : Icons.mic,
          color: Colors.white,
        ),
      )),
    );
  }
}
