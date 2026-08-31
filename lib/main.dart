import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magazine_info/views/widgets/drawer.dart';
import 'package:magazine_info/views/widgets/partie_icons.dart';
import 'package:magazine_info/views/widgets/partie_rubrique.dart';
import 'package:magazine_info/views/widgets/partie_text.dart';
import 'package:magazine_info/views/widgets/partie_titre.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const PageAccuel(),
    );
  }
}

class PageAccuel extends StatelessWidget {
  const PageAccuel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(context),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        actions: const [Icon(Icons.search, color: Colors.white), SizedBox(width: 15,)],
        title: const Text(
          'Magazine Infos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Image(
              width: double.infinity,
              fit: BoxFit.cover,
              height: 250,
              alignment: Alignment.center,
              image: AssetImage('assets/images/mag_info.jpg'),
            ),
            PartieTitre(),
            PartieText(),
            PartieIcone(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: PartieRubrique(),
            ),
          ],
        ),
      ),
    );
  }
}
