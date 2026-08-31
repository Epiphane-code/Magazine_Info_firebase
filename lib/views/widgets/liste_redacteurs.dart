import 'package:flutter/material.dart';
import 'package:magazine_info/controllers/redacteur_controllers.dart';
import 'package:magazine_info/views/pages/modifier_redacteur.dart';
import 'package:magazine_info/views/pages/supprimer_redacteur.dart';
import 'package:provider/provider.dart';

class ListeRedacteurs extends StatefulWidget {
  const ListeRedacteurs({super.key});

  @override
  State<ListeRedacteurs> createState() => _ListeRedacteursState();
}

class _ListeRedacteursState extends State<ListeRedacteurs> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RedacteurController>().loadRedacteurs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RedacteurController>();

    final redacteurs = controller.redacteurs;

    return controller.isLoading
        ? const Center(child: CircularProgressIndicator())
        : redacteurs.isEmpty
        ? const Center(child: Text("Aucun redacteur"))
        : ListView.builder(
            itemCount: redacteurs.length,
            itemBuilder: (context, index) {
              final redacteur = redacteurs[redacteurs.length - index - 1];

              return Card(
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(redacteur.nom),
                  subtitle: Text(redacteur.discipline),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateRedacteur(redacteur),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit, color: Colors.redAccent),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeleteConfirm(redacteur),
                              ),
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
