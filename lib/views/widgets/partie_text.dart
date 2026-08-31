import 'package:flutter/material.dart';

class PartieText extends StatelessWidget {
  const PartieText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child:const Text("text", style: TextStyle(fontSize: 12)),
    );
  }
}
