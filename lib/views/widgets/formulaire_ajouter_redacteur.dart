import 'package:flutter/material.dart';
import 'package:magazine_info/controllers/redacteur_controllers.dart';
import 'package:magazine_info/models/redacteur.dart';
import 'package:magazine_info/views/pages/info_redacteurs.dart';
import 'package:provider/provider.dart';

class FormulaireAddRedacteur extends StatefulWidget {
  const FormulaireAddRedacteur({super.key});

  @override
  State<FormulaireAddRedacteur> createState() => _FormulaireRedacteurState();
}

class _FormulaireRedacteurState extends State<FormulaireAddRedacteur> {
  final _formKey = GlobalKey<FormState>();

  final _nomController = TextEditingController();
  final _disciplineController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _disciplineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RedacteurController>();

    Future<void> enregistrer() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      if (controller.isLoading) {
        return;
      }

      final redacteur = Redacteur(
        id: "",
        nom: _nomController.text.trim(),
        discipline: _disciplineController.text.trim(),
      );

      await controller.addRedacteur(redacteur);

      if (mounted && !controller.isLoading) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const InfoRedacteurs()),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Ajouter un redacteur'),
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
                  onPressed: controller.isLoading ? null : enregistrer,
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
                          'Ajouter un redacteur',
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
