import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

import '../../config/const.dart';

class CarView extends StatefulWidget {
  const CarView({super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  late O3DController controller;

  @override
  void initState() {
    super.initState();
    controller = O3DController();
  }

  @override
  void dispose() {

    super.dispose();
  }

  void changeCameraPosition(double x, double y, double z) {
    controller.cameraOrbit(x, y, z);
  }

  void zoomIn() {
    // Move the camera closer to simulate zoom
    controller.cameraOrbit(
        0, 0, -0.5); // Adjust values as per your model’s scale
  }

  void zoomOut() {
    // Move the camera farther to simulate zoom
    controller.cameraOrbit(
        0, 0, 0.5); // Adjust values as per your model’s scale
  }

  void changeCarColor(String variantName) {
    controller.variantName = variantName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: O3D.asset(
              src: FilePath.threeDModel,
              controller: controller,
              cameraControls: true,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    changeCameraPosition(
                        20, 20, 5); // Change the values as needed
                  },
                  child: const Text('Change Camera'),
                ),
                ElevatedButton(
                  onPressed: zoomIn,
                  child: const Text('Zoom In'),
                ),
                ElevatedButton(
                  onPressed: zoomOut,
                  child: const Text('Zoom Out'),
                ),
                ElevatedButton(
                  onPressed: () {
                    changeCarColor('red'); // Change the color to red
                  },
                  child: const Text('Red Color'),
                ),
                ElevatedButton(
                  onPressed: () {
                    changeCarColor('blue'); // Change the color to blue
                  },
                  child: const Text('Blue Color'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
