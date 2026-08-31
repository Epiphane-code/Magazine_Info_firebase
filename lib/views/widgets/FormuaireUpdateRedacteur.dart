import 'package:flutter/material.dart';
import 'package:magazine_info/controllers/redacteur_controllers.dart';
import 'package:magazine_info/models/redacteur.dart';
import 'package:magazine_info/views/pages/info_redacteurs.dart';
import 'package:provider/provider.dart';

class FormulaireUpdateRedacteur extends StatefulWidget {
  final Redacteur redacteur;

  const FormulaireUpdateRedacteur(this.redacteur, {super.key});

  @override
  State<FormulaireUpdateRedacteur> createState() => _FormulaireRedacteurState();
}

class _FormulaireRedacteurState extends State<FormulaireUpdateRedacteur> {
  final _formKey = GlobalKey<FormState>();

  final _nomController = TextEditingController();
  final _disciplineController = TextEditingController();
  @override
  @override
  void initState() {
    super.initState();

    _nomController.text = widget.redacteur.nom;
    _disciplineController.text = widget.redacteur.discipline;
  }

  @override
  void dispose() {
    _nomController.dispose();
    _disciplineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RedacteurController>();

    Future<void> enregistrer(Redacteur redacteur) async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      if (controller.isLoading) {
        return;
      }

      final redacteurUpdate = Redacteur(
        id: redacteur.id,
        nom: _nomController.text.trim(),
        discipline: _disciplineController.text.trim(),
      );

      await controller.upDateRedacteur(redacteurUpdate);

      if (mounted && !controller.isLoading) {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: const Text("Réussie"),

              content: Text(
                "Le rédacteur ${redacteur.nom} ${redacteur.discipline}"
                "a été a ete remplace par ${redacteurUpdate.nom} ${redacteurUpdate.discipline}.",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoRedacteurs(),
                      ),
                    );
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Modifier redacteur'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 15),

              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez saisir le nom';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _disciplineController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.work),

                  labelText: 'Discipline',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez saisir la discipline';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: controller.isLoading
                      ? null
                      : () => enregistrer(widget.redacteur),
                  child: controller.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Enregister les modifications',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
