import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talent_app/constants.dart';
import 'package:talent_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talent_app/pages/employee/components/add_employee_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
final Stream<QuerySnapshot> _compagnyStream =
      FirebaseFirestore.instance.collection('employee').snapshots();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body : StreamBuilder<QuerySnapshot>(
        stream: _compagnyStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/talent.svg",
                    width: 200,
                    height: 200,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            );
          };

return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                  child: ListTile(
                leading: Image.asset(
                  "assets/images/"+data["avatar"]+".jpeg",
                  width: 50,
                  height: 120,
                ),
                title: Text(data['compagny']+", "+ data['name']),
                subtitle: Row(children: [
                  for (var skill in data["skill"]) 
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Chip(backgroundColor: kPrimaryColor,
                    label: Text(skill),
                    labelStyle: TextStyle(color: Colors.white),
                    ),)
                ]),
                    //Text("Compétences proposé : "+data["skill"][]),
                trailing: Icon(Icons.more_vert),
              ));
            }).toList(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => AddEmployeePage()),
          );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),
      );


    
  }
}

