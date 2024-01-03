import 'package:flutter/material.dart';
import 'animated_bar.dart';
import 'package:provider/provider.dart';
import 'package:ggteammobile_tp/Controllers/boxes.dart';
import 'package:ggteammobile_tp/Controllers/event.dart';
import 'package:ggteammobile_tp/Controllers/round.dart';

class RoundPage extends StatelessWidget {
  final Event _event;
  final Round _round;
  final int _roundId;

  RoundPage(this._event, this._round, this._roundId);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 2000,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Date: " + _event.date,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Wrap(
                              children: [
                                Text(
                                  "Catégorie: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _event.selectedWeight,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Wrap(
                              children: [
                                Text(
                                  "Catégorie: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _event.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phase: " + _event.selectedPhase,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.center,
                                child: Image(
                                  image:
                                  AssetImage(_event.adversaire1.imagePath),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(_event.adversaire1.firstName + " " +
                                    _event.adversaire1.lastName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage("assets/images/combat.jpeg"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.center,
                                child: Image(
                                  image:
                                  AssetImage(_event.adversaire2.imagePath),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(_event.adversaire2.firstName + " " +
                                    _event.adversaire2.lastName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Domination",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: AnimatedBar(
                                  field1: _round.dominationCombatant1,
                                  field2: _round.dominationCombatant2,
                                  categoryId: 0,
                                  roundId:_roundId,
                                  event: _event,)),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Vulnerabilité",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round
                                                .vulnerabiliteCombatant1,
                                            field2: _round
                                                .vulnerabiliteCombatant2,
                                            categoryId: 1,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Positionnement",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round
                                                .positionnementCombatant1,
                                            field2: _round
                                                .positionnementCombatant2,
                                            categoryId: 2,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Qualité des coups",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round
                                                .coupQualiteCombatant1,
                                            field2: _round
                                                .coupQualiteCombatant2,
                                            categoryId: 3,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Gestion de l'énergie",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round
                                                .gestionEnergieCombatant1,
                                            field2: _round
                                                .gestionEnergieCombatant2,
                                            categoryId: 4,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Jeu de pied",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round.piedCombatant1,
                                            field2: _round.piedCombatant2,
                                            categoryId: 5,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Défense",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round.defenseCombatant1,
                                            field2: _round.defenseCombatant2,
                                            categoryId: 6,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Perception et ajustements",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round.perceptionCombatant1,
                                            field2: _round.perceptionCombatant2,
                                            categoryId: 7,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Rythme",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round.rythmeCombatant1,
                                            field2: _round.rythmeCombatant2,
                                            categoryId: 8,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Conscience du ring",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return Expanded(
                                          flex: 1,
                                          child: AnimatedBar(
                                            field1: _round.ringCombatant1,
                                            field2: _round.ringCombatant2,
                                            categoryId: 9,
                                            roundId:_roundId,
                                            event: _event,),
                                        );
                                      },
                                    )),
                              ]),
                        ),
                      ],
                    )),
                ElevatedButton(
                  child: const Text('Commentaires'),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController commentController = TextEditingController();

                        return StatefulBuilder(
                          builder: (BuildContext context,
                              StateSetter setState) {
                            return Container(
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      controller: commentController,
                                      decoration: InputDecoration(
                                        hintText: 'Ajouter un commentaire...',
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            String newComment = commentController
                                                .text;
                                            if (newComment.isNotEmpty) {
                                              setState(() {
                                                _round.commentaire =
                                                    newComment + '\n' +
                                                        _round.commentaire;
                                                commentController.clear();
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      reverse: true,
                                      // Afficher les commentaires en ordre inverse
                                      children: _round.commentaire.isNotEmpty
                                          ? _round.commentaire.split('\n').map((
                                          comment) {
                                        return ListTile(
                                          title: Text(comment),
                                        );
                                      }).toList()
                                          : [Text('Pas de commentaire')],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                )
              ]),
        ),
      ),

    );
  }


}

