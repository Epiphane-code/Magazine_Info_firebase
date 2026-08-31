import 'package:flutter/material.dart';

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
          child: SizedBox(width: 150, child: Image(image: AssetImage('assets/images/mag2.jpeg'),))),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
          child: SizedBox(width: 150, child: Image(image: AssetImage('assets/images/mag3.jpg')))),
      ],
    );
  }
}