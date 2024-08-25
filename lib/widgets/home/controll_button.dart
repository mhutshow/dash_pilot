import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/const.dart';
import '../../controller/controllers.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularIcon(FilePath.battery),
            CircularIcon(FilePath.ac),
            CircularIcon(FilePath.cooler),
            CircularIcon(FilePath.map),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularIcon(FilePath.tire),
            CircularIcon(FilePath.mobile),
            CircularIcon(FilePath.lightStraight , isSelected: true,),
            CircularIcon(FilePath.lightDown),
          ],
        ),
      ],
    );
  }
}

class CircularIcon extends StatelessWidget {
  final String icon;
  final bool? isSelected;

  const CircularIcon(this.icon, {Key? key, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 10.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected!
              ? Theme.of(context).primaryColor
              : themeController.isDarkMode.value
              ? Colors.grey
              : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(10)),

        ),
        child: SvgPicture.asset(
          width: 30,
          icon,
          color: isSelected!
              ? Colors.white
              : Colors.white,
        ),
      ),
    );
  }
}
