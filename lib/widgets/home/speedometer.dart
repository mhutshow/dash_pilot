import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:async';

class SpeedometerScreen extends StatefulWidget {
  final bool engineStart;

  SpeedometerScreen(this.engineStart);

  @override
  _SpeedometerScreenState createState() => _SpeedometerScreenState();
}

class _SpeedometerScreenState extends State<SpeedometerScreen> {
  double _value = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer timer) {
      setState(() {
        if (_value < 140 && widget.engineStart) {
          _value++;
        } else if (!widget.engineStart) {
          _value = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfRadialGauge(
          axes: <RadialAxis>[
            // Speedometer Axis
            RadialAxis(
              minimum: 0,
              maximum: 200,
              labelOffset: 30,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.03,
              ),
              majorTickStyle: MajorTickStyle(
                length: 6,
                thickness: 4,
                color: Theme.of(context).iconTheme.color,
              ),
              minorTickStyle: MinorTickStyle(
                length: 3,
                thickness: 3,
                color: Theme.of(context).iconTheme.color,
              ),
              axisLabelStyle: GaugeTextStyle(
                color: Theme.of(context).iconTheme.color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: _value,
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.03,
                  endWidth: 0.03,
                  gradient: const SweepGradient(
                    colors: <Color>[Colors.green, Colors.yellow, Colors.red],
                    stops: <double>[0.0, 0.5, 1.0],
                  ),
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: _value,
                  needleLength: 0.95,
                  enableAnimation: true,
                  animationType: AnimationType.ease,
                  needleStartWidth: 1.5,
                  needleEndWidth: 6,
                  needleColor: Colors.red,
                  knobStyle: KnobStyle(
                    knobRadius: 0.09,
                  ),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _value.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'mph',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.75,
                ),
              ],
            ),
            // Compass Axis
            RadialAxis(
              startAngle: 270,
              endAngle: 270,
              minimum: 0,
              maximum: 80,
              interval: 10,
              radiusFactor: 0.4,
              showAxisLine: false,
              showLastLabel: false,
              minorTicksPerInterval: 4,
              majorTickStyle: MajorTickStyle(
                length: 8,
                thickness: 3,
                color: Theme.of(context).iconTheme.color,
              ),
              minorTickStyle: MinorTickStyle(
                length: 3,
                thickness: 1.5,
                color: Theme.of(context).iconTheme.color,
              ),
              axisLabelStyle: GaugeTextStyle(
                color: Theme.of(context).iconTheme.color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              onLabelCreated: (AxisLabelCreatedArgs args) {
                switch (args.text) {
                  case '0':
                    args.text = 'N';
                    args.labelStyle = GaugeTextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    );
                    break;
                  case '20':
                    args.text = 'E';
                    break;
                  case '40':
                    args.text = 'S';
                    break;
                  case '60':
                    args.text = 'W';
                    break;
                  default:
                    args.text = '';
                }
              },
            ),
          ],
        ),
        const Positioned(
          left: 30,
          top: 30,
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.bolt,
                color: Colors.grey,
                size: 24,
              ),
              SizedBox(height: 4),
              Text(
                '72%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Battery',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ),
        Positioned(
            right: 30,
            top: 30,
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.speed,
                  color: Colors.grey,
                  size: 24,
                ),
                SizedBox(height: 4),
                Text(
                  '234 Km',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Range',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
        ),

      ],
    );
  }
}
