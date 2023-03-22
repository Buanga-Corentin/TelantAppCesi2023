import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talent_app/constants.dart';
import 'package:talent_app/pages/employee/components/employee_page.dart';
import 'package:talent_app/pages/home/components/home_page.dart';
import 'package:talent_app/pages/compagny/components/compagny_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talent_app/pages/compagny/components/add_compagny_page.dart';
import 'package:talent_app/pages/map/components/map_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: [
              Text("Accueil"),
              Text("Entreprises"),
              Text("Employés"),
              Text("Carte"),
            ][_currentIndex],
            ),
        body: [
          HomePage(),
          CompagnyPage(),
          EmployeePage(),
          MapPage(),
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kSecondaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apartment),
              label: "Entreprise",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Employé",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: "Carte",
            ),
          ],
        ),
      ),
    );
  }
}
