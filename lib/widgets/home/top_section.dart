import 'package:flutter/material.dart';

import '../../controller/controllers.dart';

class CarTopSection extends StatelessWidget {
  const CarTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Porsche 911",
          style: TextStyle(
            //color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        Row(
          children: [
            GearButton("N"),
            GearButton("D", selected: true),
            GearButton("P"),
            GearButton("R"),
          ],
        ),
      ],
    );
  }
}
class GearButton extends StatelessWidget {
  final String label;
  final bool selected;

  const GearButton(this.label, {Key? key, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor
              : Colors.grey.withOpacity(0.7),
          // borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}