import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AirConditionerControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 300,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Air Conditioner',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Interior : 24°C',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 16,
                    maximum: 32,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                      thickness: 20,
                      color: Colors.grey.shade800,
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: 21.5,
                        enableAnimation: true,
                        animationDuration: 1500,
                        needleLength: 0.8,
                        needleStartWidth: 1,
                        needleEndWidth: 4,
                        knobStyle: KnobStyle(
                          color: Colors.blue,
                          sizeUnit: GaugeSizeUnit.factor,
                          knobRadius: 0.08,
                        ),
                        needleColor: Colors.blue,
                        tailStyle: TailStyle(
                          color: Colors.blue,
                          width: 4,
                          length: 0.15,
                        ),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'COOLING TO',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '21.5°C',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'UNDER 7 MIN',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        positionFactor: 0.1,
                        angle: 90,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ControlButton(icon: Icons.remove, label: '-'),
                  SizedBox(width: 50),
                  ControlButton(icon: Icons.add, label: '+'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoButton(
                    icon: Icons.speed,
                    label: 'Fan Speed',
                    value: '2 Level • Off',
                  ),
                  InfoButton(
                    icon: Icons.timer,
                    label: 'Timer',
                    value: '5 Hours • Off',
                  ),
                  InfoButton(
                    icon: Icons.ac_unit,
                    label: 'Auto Mode',
                    value: 'Power On',
                    isHighlighted: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ControlButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}

class InfoButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isHighlighted;

  const InfoButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: isHighlighted ? Colors.blue : Colors.grey,
          size: 30,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AirConditionerControl(),
  ));
}
