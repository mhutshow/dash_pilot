import 'package:flutter/material.dart';
import 'package:smart_car/widgets/home/clock_widget.dart';

import '../common/glasmorphic_container.dart';

class VideoRecordingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        // Glassmorphic video container
        SizedBox(
          width: 680,
          child: Opacity(
            opacity: 0.8, 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a22981c8-2f65-4e92-adce-fbfbd771f0e0/deyz0pf-760b4a86-5aef-4737-a1e4-04f19e57cdef.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2EyMjk4MWM4LTJmNjUtNGU5Mi1hZGNlLWZiZmJkNzcxZjBlMFwvZGV5ejBwZi03NjBiNGE4Ni01YWVmLTQ3MzctYTFlNC0wNGYxOWU1N2NkZWYuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.IuTtAKFopTJJ-JW1ctML6iIeMpON-f1t2BwGy6Kis5Y',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Positioned text and icon
        Positioned(
          top: 10,
          left: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.video_camera_back_sharp,
                    color: Colors.red,
                    size: 40,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "Recording",
                    style: TextStyle(
                      color: Colors.redAccent,
                      //fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Row(
                children: [
                  Text(
                    "24 Aug, 2024 | ",
                    style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  DigitalClock(),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
