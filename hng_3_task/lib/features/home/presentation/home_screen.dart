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

  double model1Angle = -90;
  double model2Angle = 90;

  @override
  void initState() {
    super.initState();
    controller.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller.onModelLoaded.value}');
    });
  }

  String model1 = "assets/female-talk.glb";
  String model2 = "assets/female-talk2.glb";

  void rotateModel1(bool clockwise) {
    setState(() {
      model1Angle += clockwise ? -45 : 45;
      controller.setCameraOrbit(model1Angle, 80, 120.0);
    });
  }

  void rotateModel2(bool clockwise) {
    setState(() {
      model2Angle += clockwise ? -45 : 45;
      controller2.setCameraOrbit(model2Angle, 80, 120.0);
    });
  }

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
                      controller.setCameraOrbit(model1Angle, 80, 120.0);
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
                      controller2.setCameraOrbit(model2Angle, 80, 120.0);
                    },
                  ),
                ),
              ],
            ),
          ),
          if (Theme.of(context).platform == TargetPlatform.android ||
              Theme.of(context).platform == TargetPlatform.iOS)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.rotate_left),
                          onPressed: () => rotateModel1(false),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            controller.playAnimation();
                            Future.delayed(Duration(seconds: 10), () {
                              controller.stopAnimation();
                            });
                          },
                          child: const Text('Talk'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.rotate_right),
                          onPressed: () => rotateModel1(true),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.rotate_left),
                          onPressed: () => rotateModel2(false),
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
                        IconButton(
                          icon: const Icon(Icons.rotate_right),
                          onPressed: () => rotateModel2(true),
                        ),
                      ],
                    ),
                  ],
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
              child: Container(),
            )
        ],
      ),
    );
  }
}
