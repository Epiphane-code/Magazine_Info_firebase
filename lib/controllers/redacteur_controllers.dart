import 'package:flutter/material.dart';
import 'package:magazine_info/models/redacteur.dart';
import 'package:magazine_info/repositories/redacteur_repository.dart';

class RedacteurController extends ChangeNotifier {
  final RedacteurRepository repository;

  RedacteurController(this.repository);

  List<Redacteur> redacteurs = [];

  bool isLoading = false;
  String? error;

  Future<void> loadRedacteurs() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      print("get redacteurs lanceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      redacteurs = await repository.getRedacteurs();
      print("get redacteurs termineeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addRedacteur(Redacteur redacteur) async {
    isLoading = true;
    notifyListeners();
    try {
      await repository.addRedacteur(redacteur);

      await loadRedacteurs();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRedacteur(String id) async {
    isLoading = true;
    notifyListeners();
    try {

      print("avant supppp depuis controllerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

      await repository.deleteRedacteur(id);
      
      redacteurs.removeWhere((redacteur) => redacteur.id == id);
      print("apres supppp depuis controllerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

    } catch (e) {
      error = e.toString();
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void> upDateRedacteur(Redacteur redacteur) async {
    isLoading = true;
    notifyListeners();
    try {
      await repository.upDateRedacteur(redacteur);

      await loadRedacteurs();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
