import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magazine_info/controllers/redacteur_controllers.dart';
import 'package:magazine_info/models/redacteur.dart';
import 'package:magazine_info/repositories/redacteur_repository.dart';
import 'package:magazine_info/views/pages/info_redacteurs.dart';
import 'package:provider/provider.dart';

class DeleteConfirm extends StatelessWidget {
  final Redacteur redacteur;

  const DeleteConfirm(this.redacteur, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          RedacteurController(RedacteurRepository(FirebaseFirestore.instance)),
      child: ConfirmInterface(redacteur: redacteur),
    );
  }
}

class ConfirmInterface extends StatelessWidget {
  final Redacteur redacteur;

  const ConfirmInterface({super.key, required this.redacteur});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RedacteurController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Supprimer le rédacteur"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_amber_outlined,
                color: Colors.redAccent,
                size: 80,
              ),

              const SizedBox(height: 20),

              Text(
                "Voulez-vous supprimer le rédacteur ${redacteur.nom} ?",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // BOUTON SUPPRIMER
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),

                  onPressed: controller.isLoading
                      ? null
                      : () async {
                          await controller.deleteRedacteur(redacteur.id);
                          print("apres suppppppppreeeeeesssssioonnnnnnnn");

                          if (!context.mounted) return;

                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return AlertDialog(
                                title: const Text("Suppression réussie"),

                                content: Text(
                                  "Le rédacteur ${redacteur.nom} "
                                  "a été supprimé.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const InfoRedacteurs(),
                                        ),
                                      );
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        },

                  child: controller.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          "Supprimer",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              // BOUTON ANNULER
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),

                  onPressed: controller.isLoading
                      ? null
                      : () {
                          Navigator.pop(context);
                        },

                  child: const Text("Annuler"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
