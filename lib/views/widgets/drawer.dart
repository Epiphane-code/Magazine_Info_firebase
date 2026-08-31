import 'package:flutter/material.dart';
import 'package:magazine_info/views/pages/ajouter_redacteur.dart';
import 'package:magazine_info/views/pages/info_redacteurs.dart';

// ignore: non_constant_identifier_names
Widget MyDrawer(BuildContext context) {
  return Drawer(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 50, left: 20),
          width: 300,
          height: 200,
          color: Colors.pink,
          child: const Text(
            'Magazine Info',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),

        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AjouterRedacteur(),
              ),
            );
          },
          label: const Text(
            "Ajouter un redacteur",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          icon: const Icon(
            Icons.person_add,
            size: 25,
            color: Colors.black,
          ),
        ),

        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InfoRedacteurs(),
              ),
            );
          },
          label: const Text(
            "Informations des redacteurs",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          icon: const Icon(
            Icons.group,
            size: 25,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}