import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magazine_info/controllers/redacteur_controllers.dart';
import 'package:magazine_info/repositories/redacteur_repository.dart';
import 'package:magazine_info/views/widgets/formulaire_ajouter_redacteur.dart';
import 'package:provider/provider.dart';


class AjouterRedacteur extends StatelessWidget {
  const AjouterRedacteur({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RedacteurController(
        RedacteurRepository(
          FirebaseFirestore.instance,
        ),
      ),
      child: const FormulaireAddRedacteur(),
    );
  }
}