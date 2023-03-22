import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talent_app/main.dart';
import 'employee_page.dart';
import 'package:multiselect/multiselect.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final nameController = TextEditingController();
  final compagnyController = TextEditingController();
  final avatarController = TextEditingController();
  List<String> skill = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un employee"),
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
                        labelText: "Nom de l'employee",
                        hintText: "ex : Didier Bernard ",
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
                        labelText: "Nom de l'entreprise",
                        hintText: "ex : Vinci",
                        border: OutlineInputBorder()),
                    controller: compagnyController,
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Row(children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nom de l'avatar",
                        hintText: "ex : elisabeth-borne ",
                        border: OutlineInputBorder()),
                    controller: avatarController,
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    skill = x;
                  });
                } ,
                options: const [
                  "Esprit d'equipe",
                  "C++",
                  "Flutter",
                  "C#",
                  "Front-end",
                  "Back-end",
                  "Mobile",
                ],
                selectedValues: skill,
                whenEmpty: 'Compétences',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('employee').add({
                    'name': nameController.value.text,
                    'compagny': compagnyController.value.text,
                    'avatar': avatarController.value.text,
                    'skill': skill,
                  });
                  Navigator.pop(context);
                },
                  child: Text("Ajouter"))
            ],
          )),
    );
  }
}