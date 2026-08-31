import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magazine_info/controllers/redacteur_controllers.dart';
import 'package:magazine_info/repositories/redacteur_repository.dart';
import 'package:magazine_info/views/widgets/liste_redacteurs.dart';
import 'package:provider/provider.dart';

class InfoRedacteurs extends StatelessWidget {
  const InfoRedacteurs({super.key});

  @override
 Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RedacteurController(
        RedacteurRepository(
          FirebaseFirestore.instance,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Information des redacteurs"),
          centerTitle: true,
        ),
        body: const ListeRedacteurs(),
      ),
    );
  }
}