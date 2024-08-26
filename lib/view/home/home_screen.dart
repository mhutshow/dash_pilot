import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';
import 'package:smart_car/widgets/home/controll_button.dart';
import 'package:smart_car/widgets/home/top_section.dart';
import 'package:smart_car/widgets/home/weather.dart';

import '../../config/const.dart';
import '../../widgets/common/glasmorphic_container.dart';
import '../../widgets/common/glass_container_button.dart';
import '../../widgets/home/3d_car.dart';
import '../../widgets/home/camera.dart';
import '../../widgets/home/clock_widget.dart';
import '../../widgets/home/speedometer.dart';
import '../../widgets/home/tire_pressure.dart';
import '../../widgets/home/todo.dart';
import '../audio_player/audio_player.dart';
import '../car/car.dart';
import '../map/map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         // Background image for the dashboard
          Image.asset(
            FilePath.bg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  // Positioning the weather widget
                  Positioned(
                    left: 520,
                    child: const Weather(),
                  ),
                  // Widgets grouped together
                  Positioned(
                    left: 520,
                    top: 220,
                    child: SizedBox(
                      width: 400,
                      child: Column(
                        children: [
                          _buildIconRow([
                            GlassContainerWidget(
                              iconPath: FilePath.humidity,
                              label: "Humidity",
                            ),
                            GlassContainerWidget(
                              iconPath: FilePath.wind,
                              label: "Wind",
                            ),
                            GlassContainerWidget(
                              iconPath: FilePath.music,
                              label: "Music",
                            ),
                          ]),
                          const SizedBox(height: 20),
                          _buildIconRow([
                            GlassContainerWidget(
                              iconPath: FilePath.sos,
                              label: "SOS",
                            ),
                            GlassContainerWidget(
                              iconPath: FilePath.bluetooth,
                              label: "Bluetooth",
                            ),
                            GlassContainerWidget(
                              iconPath: FilePath.location,
                              label: "Map",
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  // Positioning the tire pressure widget
                  Positioned(
                    left: 940,
                    top: 220,
                    child: GlassmorphicContainer(
                      width: 260,
                      height: 260,
                      child: TirePressureWidget(),
                    ),
                  ),

                  Positioned(
                    left: 940,
                    child: GlassmorphicContainer(
                      width: 260,
                      height: 200,
                      child: GlassmorphicClockScreen(),
                    ),
                  ),
                  Positioned(
                    left: 800,
                    top: 500,
                    child: GlassmorphicContainer(
                      width: 400,
                      height: 280,
                      child: GlassmorphicMusicPlayer(),
                    ),
                  ),
                  Positioned(
                    left: 520,
                    top: 500,
                    child: GlassmorphicContainer(
                      width: 260,
                      height: 280,
                      child: GlassmorphicTodoScreen(),
                    ),
                  ),

                  Positioned(
                    left: 520,
                    top: 800,
                    child: GlassmorphicContainer(
                      width: 680,
                      height: 210,
                      child: VideoRecordingScreen(),
                    ),
                  ),
                  // Centered section including the car display and control buttons
                  RepaintBoundary(
                    child: GlassmorphicContainer(
                      width: 500,
                      height: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => CarView());
                              },
                              child: const CarTopSection()),
                          CarImageWithTiltedCircle(),
                          const SizedBox(height: 20),
                          const ControlButtons(),
                          const SizedBox(height: 20),
                          Divider(
                            height: 2,
                            indent: 50,
                            endIndent: 50,
                            color: Colors.grey.withOpacity(0.5),
                            thickness: 4,
                          ),
                          const SizedBox(height: 20),
                          SpeedometerScreen(false),
                          Center(
                            child: SliderButton(
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              width: 400,
                              action: () async {
                                // Add your engine start action here
                              },
                              label: const Center(
                                child: Text(
                                  "Slide to start Engine",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
                              icon: const Icon(Icons.power_settings_new),
                              buttonColor: Colors.redAccent.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Positioning the map display
                  Positioned(
                    left: 1220,
                    child: SizedBox(
                      height: 1010,
                      width: 640,
                      child: GlassmorphicContainer(
                        width: 500,
                        height: double.infinity,
                        child: Opacity(
                          opacity: 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: NavigationMapScreen()),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a reusable glass container with an icon and label
  Widget _buildIconRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
