import 'package:flutter/material.dart';
import 'package:ggteammobile_tp/pages/Listecombat_page.dart';
import 'package:ggteammobile_tp/pages/creer_combat.dart';
import 'package:ggteammobile_tp/providers/utilisateur_provider.dart';
import 'package:provider/provider.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

import 'sommaire_page.dart';

class AcceuilPage extends StatefulWidget {
  @override
  _AcceuilPageState createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {

  // Create a GlobalKey for the Scaffold to open the drawer.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var utilisateurProvider = Provider.of<UtilisateurProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("GGBoxingApp"),
        actions: [
          IconButton(
            icon: Icon(Icons.person_rounded),
            onPressed: () {
              // Open the drawer when the IconButton is pressed.
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (utilisateurProvider.isLoggedIn &&
                utilisateurProvider.hasRole("admin"))
            ElevatedButton.icon(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreerCombatPage()),
                  );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(
                  MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  60,
                ),
              ),
              icon: Icon(Icons.add),
              label: Text('Créer un nouveau combat'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListCombatPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(
                  MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  60,
                ),
              ),
              icon: Icon(Icons.search),
              label: Text('Consulter les combats'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                // You can add an image here if you have user avatars.
                // child: Image.asset("your_avatar_image.png"),
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              SizedBox(height: 10),
              Text(
                utilisateurProvider.name ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              // Other drawer items can be added here if needed.
            ],
          ),
        ),
      ),
    );
  }

}