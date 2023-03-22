import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talent_app/constants.dart';
import 'package:talent_app/main.dart';
import 'package:talent_app/pages/compagny/components/compagny_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Talent App 2023",
                style: TextStyle(
                  fontSize: 42,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: kTextColor,
                ),
              ),
              const Text(
                "Application d'echanges de compétences des entreprises.",
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top : 10),
                ),
              /* ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                   PageRouteBuilder(
                    pageBuilder: (_, __, ___) => CompagnyPage()
                   )
                   );
                },
                 label: const Text(
                  "Accéder au entreprise",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  icon: Icon(Icons.search),
                  
                  
                 ), */
            ],
          ),
        );
  }
}