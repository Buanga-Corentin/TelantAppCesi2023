import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talent_app/constants.dart';
import 'package:talent_app/main.dart';
import 'add_compagny_page.dart';

class CompagnyPage extends StatefulWidget {
  const CompagnyPage({super.key});

  @override
  State<CompagnyPage> createState() => _CompagnyPageState();
}

class _CompagnyPageState extends State<CompagnyPage> {
  final Stream<QuerySnapshot> _compagnyStream =
      FirebaseFirestore.instance.collection('compagny').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
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
          }
          ;
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                  child: ListTile(
                leading: Image.asset(
                  data['picture'],
                  width: 50,
                  height: 120,
                ),
                title: Text(data['name']),
                subtitle:
                    Text(data['num_employee'] + " persoonne(s) disponible(s)"),
                trailing: Icon(Icons.more_vert),
              ));
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => AddCompagnyPage()),
          );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
