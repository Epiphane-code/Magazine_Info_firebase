import 'package:flutter/material.dart';

class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const Icon(Icons.call, color: Colors.pink),
                const Text('TEL', style: TextStyle(color: Colors.pink)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),

            child: Column(
              children: [
                const Icon(Icons.email, color: Colors.pink),
                const Text('MAIL', style: TextStyle(color: Colors.pink)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),

            child: Column(
              children: [
                const Icon(Icons.share, color: Colors.pink),
                const Text('PARTAGE', style: TextStyle(color: Colors.pink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
