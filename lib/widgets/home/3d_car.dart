import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

import '../../config/const.dart';

class CarImageWithTiltedCircle extends StatefulWidget {
  const CarImageWithTiltedCircle({Key? key}) : super(key: key);

  @override
  State<CarImageWithTiltedCircle> createState() => _CarImageWithTiltedCircleState();
}

class _CarImageWithTiltedCircleState extends State<CarImageWithTiltedCircle> {
  O3DController controller = O3DController();

  void changeCameraPosition(){
    // controller.cameraOrbit(20, 20, 5),
    // controller.cameraTarget(1.2, 1, 4),
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Tilted circle layer under the car
        Positioned(
          bottom: -45, 
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(20 * 3.1415927 / 180) 
              ..scale(1.2, 0.6),
            child: Container(
              width: 350, 
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue.withOpacity(0.3),
                  width: 4.0,
                ),
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  center: Alignment(0, 0), 
                  radius: 0.8,
                ),
              ),
            ),
          ),
        ),
        // Car Image
         SizedBox(
          height: 310,
          child: O3D.asset(
            src: FilePath.threeDModel,
            controller: controller,
          ), // Your 3D Car widget
        ),
        // Lock Icons on the sides


       //  Positioned(
       //    left: 180,
       //    bottom:10,
       //    child: Text("Left Door Open")
       // ),
        // Positioned(
        //   left: 40,
        //   bottom: 100,
        //   child: CircleAvatar(
        //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //     child: const Icon(Icons.lock),
        //   ),
        // ),
        // Positioned(
        //   right: 40,
        //   bottom: 100,
        //   child: CircleAvatar(
        //     backgroundColor: Theme.of(context).primaryColor,
        //     child: const Icon(Icons.lock_open, color: Colors.white),
        //   ),
        // ),
      ],
    );
  }
}