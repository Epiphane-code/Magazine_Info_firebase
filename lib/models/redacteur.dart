import 'package:cloud_firestore/cloud_firestore.dart';

class Redacteur {
  final String id;
  final String nom;
  final String discipline;

  Redacteur({required this.id, required this.nom, required this.discipline});

  factory Redacteur.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    return Redacteur(
      id: doc.id,
      nom: data['nom'] ?? '',
      discipline: data['discipline'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'nom': nom, 'discipline': discipline};
  }

  factory Redacteur.upDate(Redacteur redacteur) {
    return Redacteur(
      id: redacteur.id,
      nom: redacteur.nom,
      discipline: redacteur.discipline,
    );
  }
}
