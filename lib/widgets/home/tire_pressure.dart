import 'package:flutter/material.dart';
import 'package:smart_car/widgets/common/glasmorphic_container.dart';

class TirePressureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        width: 300,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.directions_car, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Tire Pressure",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "Last Update: 7m ago",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 80,
                children: List.generate(4, (index) {

                  return TirePressureTile(pressure: "23.5", unit: "BAR");
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TirePressureTile extends StatelessWidget {
  final String pressure;
  final String unit;

  const TirePressureTile({
    Key? key,
    required this.pressure,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pressure,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TirePressureWidget(),
  ));
}
