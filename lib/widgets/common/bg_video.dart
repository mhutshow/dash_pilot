// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:ui';
//
// class BackgroundVideo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final VideoController videoController = Get.put(VideoController());
//
//     return FutureBuilder(
//       future: videoController.initializeVideoPlayerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (videoController.videoPlayerController.value.isInitialized) {
//             return Stack(
//               children: [
//                 SizedBox.expand(
//                   child: FittedBox(
//                     fit: BoxFit.cover,
//                     child: SizedBox(
//                       width: videoController.videoPlayerController.value.size.width,
//                       height: videoController.videoPlayerController.value.size.height,
//                       child: VideoPlayer(videoController.videoPlayerController),
//                     ),
//                   ),
//                 ),
//                 BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
//                   child: Container(
//                     color: Colors.black.withOpacity(0.6),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Center(child: Text('Failed to load video'));
//           }
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
//
//
//
// class VideoController extends GetxController {
//   late VideoPlayerController videoPlayerController;
//   late Future<void> initializeVideoPlayerFuture;
//
//   @override
//   void onInit() {
//     super.onInit();
//     videoPlayerController = VideoPlayerController.asset('assets/3d/video.mp4');
//     initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
//       videoPlayerController.setPlaybackSpeed(0.7); // Set the playback speed to 0.5x for slower playback
//       videoPlayerController.setLooping(true);
//       videoPlayerController.play();
//     }).catchError((error) {
//       print('Error initializing video player: $error');
//     });
//   }
//
//   @override
//   void onClose() {
//     videoPlayerController.dispose();
//     super.onClose();
//   }
// }