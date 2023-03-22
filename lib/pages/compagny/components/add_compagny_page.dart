import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talent_app/main.dart';
import 'compagny_page.dart';
import 'package:multiselect/multiselect.dart';

class AddCompagnyPage extends StatefulWidget {
  const AddCompagnyPage({super.key});

  @override
  State<AddCompagnyPage> createState() => _AddCompagnyPageState();
}

class _AddCompagnyPageState extends State<AddCompagnyPage> {
  final nameController = TextEditingController();
  final numEmployeeController = TextEditingController();
  final pictureController = TextEditingController();
  final positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une entreprise"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
             ListTile(
                title: Row(children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nom de l'entreprise ",
                        hintText: "ex : Vinci",
                        border: OutlineInputBorder()),
                    controller: nameController,
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Row(children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nombre d'employer",
                        hintText: "ex : 1500",
                        border: OutlineInputBorder()),
                    controller: numEmployeeController,
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Row(children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        labelText: "Chemin de la photo",
                        hintText: "ex : assets/images/vinci.png ",
                        border: OutlineInputBorder()),
                    controller: pictureController,
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Row(children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Postion GPS',
                        hintText: "ex : 47.994039575749134, 0.18626412352264443",
                        border: OutlineInputBorder()),
                    controller: positionController,
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('compagny').add({
                    'name': nameController.value.text,
                    'num_employee': numEmployeeController.value.text,
                    'picture': pictureController.value.text,
                    'position': positionController.value.text,
                  });
                  Navigator.pop(context);
                },
                  child: Text("Ajouter"))
            ],
          )),
    );
  }
}
