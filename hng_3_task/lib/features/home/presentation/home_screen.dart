import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Flutter3DController controller = Flutter3DController();
  Flutter3DController controller2 = Flutter3DController();
  String? selectedAnimation;
  List<String> animationsList = [];

  @override
  void initState() {
    super.initState();
    controller.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller.onModelLoaded.value}');
    });
  }

  String model1 = "assets/female-talk.glb";
  String model2 = "assets/female-talk2.glb";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Flutter3DViewer(
                    src: model1,
                    progressBarColor: Colors.orange,
                    controller: controller,
                    onProgress: (double progressValue) {
                      debugPrint('model loading progress : $progressValue');
                    },
                    onLoad: (String modelAddress) {
                      debugPrint('model loaded : $modelAddress');
                      controller.setCameraOrbit(-90, 80, 120.0);
                    },
                  ),
                ),
                Expanded(
                  child: Flutter3DViewer(
                    src: model2,
                    progressBarColor: Colors.orange,
                    controller: controller2,
                    onProgress: (double progressValue) {
                      debugPrint('model loading progress : $progressValue');
                    },
                    onLoad: (String modelAddress) {
                      debugPrint('model loaded : $modelAddress');
                      controller2.setCameraOrbit(90, 80, 120.0);
                    },
                  ),
                ),
              ],
            ),
          ),
          if (Theme.of(context).platform == TargetPlatform.android ||
              Theme.of(context).platform == TargetPlatform.iOS)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    controller.playAnimation();
                    Future.delayed(Duration(seconds: 10), () {
                      controller.stopAnimation();
                    });
                  },
                  child: const Text('Talk'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller2.playAnimation();
                    Future.delayed(Duration(seconds: 10), () {
                      controller2.stopAnimation();
                    });
                  },
                  child: const Text('Talk'),
                ),
              ],
            )
          else
            KeyboardListener(
                focusNode: FocusNode(),
                onKeyEvent: (value) {
                  if (value is KeyDownEvent) {
                    switch (value.logicalKey.keyLabel) {
                      case 'Space':
                        controller.playAnimation();
                        controller2.playAnimation();
                        Future.delayed(Duration(seconds: 10), () {
                          controller.stopAnimation();
                          controller2.stopAnimation();
                        });
                        break;
                    }
                  }
                },
                child: Container())
        ],
      ),
    );
  }
}
