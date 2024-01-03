import 'package:flutter/material.dart';
import 'package:ggteammobile_tp/Controllers/boxes.dart';
import 'package:ggteammobile_tp/Controllers/combatant.dart';
import 'package:ggteammobile_tp/Controllers/event.dart';
import 'package:ggteammobile_tp/Controllers/round.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:ggteammobile_tp/pages/Listecombat_page.dart';
import 'package:hive/hive.dart';

import 'combat_page.dart';

class CreerCombatPage extends StatefulWidget {
  final int? id;

  CreerCombatPage({this.id});

  @override
  _CreerCombatPageState createState() => _CreerCombatPageState();
}

class _CreerCombatPageState extends State<CreerCombatPage> {
  String _selectedWeight = 'moins de 49 kg : poids mi-mouches';
  String _selectedPhase = 'N/A';

  int newID = boxEvents.getAt(boxEvents.length - 1).id + 1;
  Combatant _selectedCombattant1 = boxCombatants.getAt(0);
  Combatant _selectedCombattant2 = boxCombatants.getAt(1);

  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();

  late Event _event;

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      _event = boxEvents.get(widget.id);
      if (_event != null) {
        eventNameController.text = _event!.name;
        eventDateController.text = _event!.date;
        _selectedWeight = _event!.selectedWeight;
        _selectedPhase = _event!.selectedPhase;
        _selectedCombattant1 = _event!.adversaire1;
        _selectedCombattant2 = _event!.adversaire2;
      }
    }
  }

  ElevatedButton createOrUpdateButton() {
    if (widget.id != null) {
      return ElevatedButton.icon(
        onPressed: () {
          _event!.name = eventNameController.text;
          _event!.date = eventDateController.text;
          _event!.selectedWeight = _selectedWeight;
          _event!.selectedPhase = _selectedPhase;
          _event!.adversaire1 = _selectedCombattant1;
          _event!.adversaire2 = _selectedCombattant2;

          boxEvents.put(widget.id, _event!);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListCombatPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          minimumSize: Size(
            MediaQuery.of(context).size.width * 0.9,
            60,
          ),
        ),
        icon: Icon(Icons.edit),
        label: Text('Modifier'),
      );
    } else {
      return ElevatedButton.icon(
        onPressed: () {
          _event = Event(
            id: newID,
            name: eventNameController.text,
            date: eventDateController.text,
            selectedWeight: _selectedWeight,
            selectedPhase: _selectedPhase,
            adversaire1: _selectedCombattant1,
            adversaire2: _selectedCombattant2,
            // Ajoutez les informations pour round1, round2, round3

            round1: Round(
                dominationCombatant1: 0,
                dominationCombatant2: 0,
                vulnerabiliteCombatant1: 0,
                vulnerabiliteCombatant2: 0,
                positionnementCombatant1: 0,
                positionnementCombatant2: 0,
                coupQualiteCombatant1: 0,
                coupQualiteCombatant2: 0,
                gestionEnergieCombatant1: 0,
                gestionEnergieCombatant2: 0,
                piedCombatant1: 0,
                piedCombatant2: 0,
                defenseCombatant1: 0,
                defenseCombatant2: 0,
                perceptionCombatant1: 0,
                perceptionCombatant2: 0,
                rythmeCombatant1: 0,
                rythmeCombatant2: 0,
                ringCombatant1: 0,
                ringCombatant2: 0,
                commentaire: ""),

            round2: Round(
                dominationCombatant1: 0,
                dominationCombatant2: 0,
                vulnerabiliteCombatant1: 0,
                vulnerabiliteCombatant2: 0,
                positionnementCombatant1: 0,
                positionnementCombatant2: 0,
                coupQualiteCombatant1: 0,
                coupQualiteCombatant2: 0,
                gestionEnergieCombatant1: 0,
                gestionEnergieCombatant2: 0,
                piedCombatant1: 0,
                piedCombatant2: 0,
                defenseCombatant1: 0,
                defenseCombatant2: 0,
                perceptionCombatant1: 0,
                perceptionCombatant2: 0,
                rythmeCombatant1: 0,
                rythmeCombatant2: 0,
                ringCombatant1: 0,
                ringCombatant2: 0,
                commentaire: ""),

            round3: Round(
                dominationCombatant1: 0,
                dominationCombatant2: 0,
                vulnerabiliteCombatant1: 0,
                vulnerabiliteCombatant2: 0,
                positionnementCombatant1: 0,
                positionnementCombatant2: 0,
                coupQualiteCombatant1: 0,
                coupQualiteCombatant2: 0,
                gestionEnergieCombatant1: 0,
                gestionEnergieCombatant2: 0,
                piedCombatant1: 0,
                piedCombatant2: 0,
                defenseCombatant1: 0,
                defenseCombatant2: 0,
                perceptionCombatant1: 0,
                perceptionCombatant2: 0,
                rythmeCombatant1: 0,
                rythmeCombatant2: 0,
                ringCombatant1: 0,
                ringCombatant2: 0,
                commentaire: ""),
          );

          boxEvents.add(_event);

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CombatPage(
                  id: newID,
                )),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          minimumSize: Size(
            MediaQuery.of(context).size.width * 0.9,
            60,
          ),
        ),
        icon: Icon(Icons.add),
        label: Text('Créer'),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de combat'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icône de retour
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        ListCombatPage()));
          },
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  constraints: BoxConstraints(maxWidth: 500.0, minWidth: 0.0),
                  width: MediaQuery.of(context).size.width *
                      0.9, // 90% of device width
                  child: TextField(
                    controller: eventNameController, // Ajoutez le contrôleur
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Nom de l'évènement",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  constraints: BoxConstraints(maxWidth: 500.0, minWidth: 0.0),
                  width: MediaQuery.of(context).size.width *
                      0.9, // 90% of device width
                  child: TextField(
                    controller: eventDateController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Date de l'évènement",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                    constraints: BoxConstraints(maxWidth: 500.0, minWidth: 0.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Sélectionnez une Catégorie de Poids :',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 10.0),
                Container(
                  constraints: BoxConstraints(maxWidth: 500.0, minWidth: 0.0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DropdownButtonFormField<String>(
                    value: _selectedWeight,
                    items: <String>[
                      'moins de 49 kg : poids mi-mouches',
                      'entre 49 et 52 kg : poids mouches',
                      'entre 52 et 56 kg : poids coqs',
                      'entre 56 et 60 kg : poids légers',
                      'entre 60 et 64 kg : poids super-légers',
                      'entre 64 et 69 kg : poids welters',
                      'entre 69 et 75 kg : poids moyens',
                      'entre 75 et 81 kg : poids mi-lourds',
                      'entre 81 et 91 kg : poids lourds',
                      'plus de 91 kg : poids super-lourds'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedWeight = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                    constraints: BoxConstraints(maxWidth: 500.0, minWidth: 0.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Sélectionnez une Phase :',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 10.0),
                Container(
                  constraints: BoxConstraints(maxWidth: 500.0, minWidth: 0.0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DropdownButtonFormField<String>(
                    value: _selectedPhase,
                    items: <String>[
                      'N/A',
                      'Qualifications',
                      'Quart de Finales',
                      'Demi-Finales',
                      'Finales',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPhase = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 500.0, minWidth: 0.0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Choisir un combattant"),
                                      content: Container(
                                        width:
                                        300, // Ajustez la largeur au besoin
                                        height:
                                        500, // Ajustez la hauteur au besoin
                                        child: ListView.builder(
                                          itemCount: boxCombatants.length,
                                          itemBuilder: (context, index) {
                                            final combatant = boxCombatants
                                                .getAt(index) as Combatant;
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _selectedCombattant1 =
                                                        combatant;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image.asset(
                                                    combatant.imagePath),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("Fermer"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("1er combattant"),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Image.asset(_selectedCombattant1.imagePath),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 10.0,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Choisir un combattant"),
                                      content: Container(
                                        width: 300,
                                        // Ajustez la largeur au besoin
                                        height: 500,
                                        // Ajustez la hauteur au besoin
                                        child: ListView.builder(
                                          itemCount: boxCombatants.length,
                                          itemBuilder: (context, index) {
                                            final combatant = boxCombatants
                                                .getAt(index) as Combatant;
                                            debugPrint(
                                                "Index $index: ${combatant.imagePath}"); // Affiche les informations dans la console
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _selectedCombattant2 =
                                                        combatant;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image.asset(
                                                    combatant.imagePath),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("Fermer"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("2e combattant"),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Image.asset(_selectedCombattant2.imagePath),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                createOrUpdateButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}