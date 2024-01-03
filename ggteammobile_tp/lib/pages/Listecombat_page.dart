import 'package:flutter/material.dart';
import "package:flutter_guid/flutter_guid.dart";
import 'package:ggteammobile_tp/Controllers/boxes.dart';
import 'package:ggteammobile_tp/Controllers/combatant.dart';
import 'package:ggteammobile_tp/pages/acceuil_page.dart';
import 'package:ggteammobile_tp/pages/sommaire_page.dart';
import 'package:hive/hive.dart';
import '../Controllers/event.dart';
import 'combat_page.dart';
import 'package:ggteammobile_tp/pages/creer_combat.dart';
import 'package:ggteammobile_tp/providers/utilisateur_provider.dart';
import 'package:provider/provider.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class ListCombatPage extends StatefulWidget {
  @override
  _ListCombatPageState createState() => _ListCombatPageState();
}
class _ListCombatPageState extends State<ListCombatPage> {
  bool isChoiceMade = false;
  int selectedItemIndex = -1; // Index of the selected item
  List combats = boxEvents.values.toList();

  @override
  Widget build(BuildContext context) {
    var utilisateurProvider = Provider.of<UtilisateurProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des combats'),
        backgroundColor: Colors.blue[500],
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icône de retour
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AcceuilPage()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Choisir un combat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)), // Border radius
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.blue[100],
                  child: ListView.builder(
                    itemCount: combats.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: index == selectedItemIndex ? Colors.red : null,
                        child: ListTile(
                          title: Text(combats[index].name),
                          onTap: () {
                            setState(() {
                              isChoiceMade = true;
                              selectedItemIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: selectedItemIndex != -1
                      ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SummaryPage(
                            id: combats[selectedItemIndex].id),
                      ),
                    );
                  }
                      : null,
                  child: Text('Sommaire'),
                ),
                ElevatedButton(
                  onPressed: selectedItemIndex != -1
                      ? () {
                    if (utilisateurProvider.isLoggedIn &&
                        utilisateurProvider.hasRole("admin")) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreerCombatPage(
                              id: combats[selectedItemIndex].id),
                        ),
                      );
                    }
                  }
                      : null,
                  child: Text('Modifier'),
                ),
                ElevatedButton(
                  onPressed: selectedItemIndex != -1
                      ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CombatPage(
                            id: combats[selectedItemIndex].id),
                      ),
                    );
                  }
                      : null,
                  child: Text('Accept'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}