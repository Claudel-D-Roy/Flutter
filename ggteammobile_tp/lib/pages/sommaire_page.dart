import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ggteammobile_tp/Controllers/boxes.dart';
import 'package:ggteammobile_tp/Controllers/event.dart';
import 'package:ggteammobile_tp/Controllers/round.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key, required this.id});

  final int id;

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  late Event _event; // Declare a variable to hold the event
  late Round _round1;
  late Round _round2;
  late Round _round3;

  late int totalcombatant1;
  late int totalcombatant2;

  @override
  void initState() {
    super.initState();
    _loadEvent(); // Load the event when the page initializes
  }

  void _loadEvent() async {
    // Retrieve the event by the id
    _event = boxEvents.get(widget.id);
    _round1 = _event.round1;
    _round2 = _event.round2;
    _round3 = _event.round3;

    totalcombatant1 = _round1.dominationCombatant1 +
        _round1.vulnerabiliteCombatant1 +
        _round1.positionnementCombatant1 +
        _round1.coupQualiteCombatant1 +
        _round1.gestionEnergieCombatant1 +
        _round1.piedCombatant1 +
        _round1.defenseCombatant1 +
        _round1.perceptionCombatant1 +
        _round1.rythmeCombatant1 +
        _round1.ringCombatant1 +
        _round2.dominationCombatant1 +
        _round2.vulnerabiliteCombatant1 +
        _round2.positionnementCombatant1 +
        _round2.coupQualiteCombatant1 +
        _round2.gestionEnergieCombatant1 +
        _round2.piedCombatant1 +
        _round2.defenseCombatant1 +
        _round2.perceptionCombatant1 +
        _round2.rythmeCombatant1 +
        _round2.ringCombatant1 +
        _round3.dominationCombatant1 +
        _round3.vulnerabiliteCombatant1 +
        _round3.positionnementCombatant1 +
        _round3.coupQualiteCombatant1 +
        _round3.gestionEnergieCombatant1 +
        _round3.piedCombatant1 +
        _round3.defenseCombatant1 +
        _round3.perceptionCombatant1 +
        _round3.rythmeCombatant1 +
        _round3.ringCombatant1;

    totalcombatant2 = _round1.dominationCombatant2 +
        _round1.vulnerabiliteCombatant2 +
        _round1.positionnementCombatant2 +
        _round1.coupQualiteCombatant2 +
        _round1.gestionEnergieCombatant2 +
        _round1.piedCombatant2 +
        _round1.defenseCombatant2 +
        _round1.perceptionCombatant2 +
        _round1.rythmeCombatant2 +
        _round1.ringCombatant2 +
        _round2.dominationCombatant2 +
        _round2.vulnerabiliteCombatant2 +
        _round2.positionnementCombatant2 +
        _round2.coupQualiteCombatant2 +
        _round2.gestionEnergieCombatant2 +
        _round2.piedCombatant2 +
        _round2.defenseCombatant2 +
        _round2.perceptionCombatant2 +
        _round2.rythmeCombatant2 +
        _round2.ringCombatant2 +
        _round3.dominationCombatant2 +
        _round3.vulnerabiliteCombatant2 +
        _round3.positionnementCombatant2 +
        _round3.coupQualiteCombatant2 +
        _round3.gestionEnergieCombatant2 +
        _round3.piedCombatant2 +
        _round3.defenseCombatant2 +
        _round3.perceptionCombatant2 +
        _round3.rythmeCombatant2 +
        _round3.ringCombatant2;

    setState(() {}); // Update the UI with the loaded event
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sommaire'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Icône de retour
            onPressed: () {
              // Action à effectuer lorsque le bouton Back est appuyé
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30.0),
                Center(
                  child: Text(
                    "Gagnant",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    totalcombatant2 > totalcombatant1
                        ? _event.adversaire2.firstName +
                            " " +
                            _event.adversaire2.lastName
                        : _event.adversaire1.firstName +
                            " " +
                            _event.adversaire1.lastName,
                    style: TextStyle(
                        fontSize: 26.0,
                        color: totalcombatant2 > totalcombatant1
                            ? Colors.red
                            : Colors.blue),
                  ),
                ),
                SizedBox(height: 30.0),
                Center(
                  child: Text(
                    "Perdant",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    totalcombatant2 < totalcombatant1
                        ? _event.adversaire2.firstName +
                            " " +
                            _event.adversaire2.lastName
                        : _event.adversaire1.firstName +
                            " " +
                            _event.adversaire1.lastName,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: totalcombatant2 < totalcombatant1
                            ? Colors.red
                            : Colors.blue),
                  ),
                ),
                SizedBox(height: 50.0),
                Divider(),
                SizedBox(height: 50.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300.0,
                    child: BarChart(
                      BarChartData(
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: true,
                          drawVerticalLine: false,
                          horizontalInterval: 3.0,
                          checkToShowHorizontalLine: (double value) {
                            return value == 3.0 ||
                                value == 6.0 ||
                                value == 9.0 ||
                                value == 12.0 ||
                                value == 15.0;
                          },
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                            showTitles: true,
                            // Afficher les titres de l'axe des Y
                            getTextStyles: (context, value) => TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            margin: 10,
                            reservedSize: 20,
                            interval: 3.0,
                          ),
                          rightTitles: SideTitles(
                            showTitles: false,
                          ),
                          topTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            left: BorderSide(
                              color: const Color(0xff37434d),
                              width: 4,
                            ),
                            bottom: BorderSide(
                              color: const Color(0xff37434d),
                              width: 4,
                            ),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.dominationCombatant1 +
                                        _round2.dominationCombatant1 +
                                        _round3.dominationCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.dominationCombatant2 +
                                        _round2.dominationCombatant2 +
                                        _round3.dominationCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.vulnerabiliteCombatant1 +
                                        _round2.vulnerabiliteCombatant1 +
                                        _round3.vulnerabiliteCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.vulnerabiliteCombatant2 +
                                        _round2.vulnerabiliteCombatant2 +
                                        _round3.vulnerabiliteCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.positionnementCombatant1 +
                                        _round2.positionnementCombatant1 +
                                        _round3.positionnementCombatant1)
                                    .toDouble(), // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.positionnementCombatant2 +
                                        _round2.positionnementCombatant2 +
                                        _round3.positionnementCombatant2)
                                    .toDouble(), // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.coupQualiteCombatant1 +
                                        _round2.coupQualiteCombatant1 +
                                        _round3.coupQualiteCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.coupQualiteCombatant2 +
                                        _round2.coupQualiteCombatant2 +
                                        _round3.coupQualiteCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.gestionEnergieCombatant1 +
                                        _round2.gestionEnergieCombatant1 +
                                        _round3.gestionEnergieCombatant1)
                                    .toDouble(), // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.gestionEnergieCombatant2 +
                                        _round2.gestionEnergieCombatant2 +
                                        _round3.gestionEnergieCombatant2)
                                    .toDouble(), // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.piedCombatant1 +
                                        _round2.piedCombatant1 +
                                        _round3.piedCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.piedCombatant2 +
                                        _round2.piedCombatant2 +
                                        _round3.piedCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 7,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.defenseCombatant1 +
                                        _round2.defenseCombatant1 +
                                        _round3.defenseCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.defenseCombatant2 +
                                        _round2.defenseCombatant2 +
                                        _round3.defenseCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 8,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.perceptionCombatant1 +
                                        _round2.perceptionCombatant1 +
                                        _round3.perceptionCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.perceptionCombatant2 +
                                        _round2.perceptionCombatant2 +
                                        _round3.perceptionCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 9,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.rythmeCombatant1 +
                                        _round2.rythmeCombatant1 +
                                        _round3.rythmeCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.rythmeCombatant2 +
                                        _round2.rythmeCombatant2 +
                                        _round3.rythmeCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 10,
                            barRods: [
                              BarChartRodData(
                                y: (_round1.ringCombatant1 +
                                        _round2.ringCombatant1 +
                                        _round3.ringCombatant1)
                                    .toDouble(),
                                // Score pour le combattant 1
                                colors: [Colors.blue],
                                width: 4.0,
                              ),
                              BarChartRodData(
                                y: (_round1.ringCombatant2 +
                                        _round2.ringCombatant2 +
                                        _round3.ringCombatant2)
                                    .toDouble(),
                                // Score pour le combattant 2
                                colors: [Colors.red],
                                width: 4.0,
                              ),
                            ],
                          ),
                        ],
                        minY: 0,
                        maxY: 15,
                        groupsSpace: 10,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.blueAccent,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              String labelText = '';
                              switch (rodIndex) {
                                case 0:
                                  labelText = 'Combattant 1: ${rod.y}';
                                  break;
                                case 1:
                                  labelText = 'Combattant 2: ${rod.y}';
                                  break;
                              }
                              return BarTooltipItem(
                                labelText,
                                TextStyle(color: Colors.white),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              _event.adversaire1.firstName +
                                  " " +
                                  _event.adversaire1.lastName,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text((_round1.dominationCombatant1 +
                                    _round2.dominationCombatant1 +
                                    _round3.dominationCombatant1)
                                .toString()),
                            Text((_round1.vulnerabiliteCombatant1 +
                                    _round2.vulnerabiliteCombatant1 +
                                    _round3.vulnerabiliteCombatant1)
                                .toString()),
                            Text((_round1.positionnementCombatant1 +
                                    _round2.positionnementCombatant1 +
                                    _round3.positionnementCombatant1)
                                .toString()),
                            Text((_round1.coupQualiteCombatant1 +
                                    _round2.coupQualiteCombatant1 +
                                    _round3.coupQualiteCombatant1)
                                .toString()),
                            Text((_round1.gestionEnergieCombatant1 +
                                    _round2.gestionEnergieCombatant1 +
                                    _round3.gestionEnergieCombatant1)
                                .toString()),
                            Text((_round1.piedCombatant1 +
                                    _round2.piedCombatant1 +
                                    _round3.piedCombatant1)
                                .toString()),
                            Text((_round1.defenseCombatant1 +
                                    _round2.defenseCombatant1 +
                                    _round3.defenseCombatant1)
                                .toString()),
                            Text((_round1.perceptionCombatant1 +
                                    _round2.perceptionCombatant1 +
                                    _round3.perceptionCombatant1)
                                .toString()),
                            Text((_round1.rythmeCombatant1 +
                                    _round2.rythmeCombatant1 +
                                    _round3.rythmeCombatant1)
                                .toString()),
                            Text((_round1.ringCombatant1 +
                                    _round2.ringCombatant1 +
                                    _round3.ringCombatant1)
                                .toString()),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Column(
                          children: [
                            Text(""),
                            Text(
                              "(1) Domination",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(2) Vulnérabilité",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(3) Positionnement",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(4) Qualité des coups",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(5) Gestion de l'énergie",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(6) Jeu de pied",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(7) Défense",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(8) Perception et ajustements",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(9) Rythme",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(10) Conscience du ring",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              _event.adversaire2.firstName +
                                  " " +
                                  _event.adversaire2.lastName,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text((_round1.dominationCombatant2 +
                                    _round2.dominationCombatant2 +
                                    _round3.dominationCombatant2)
                                .toString()),
                            Text((_round1.vulnerabiliteCombatant2 +
                                    _round2.vulnerabiliteCombatant2 +
                                    _round3.vulnerabiliteCombatant2)
                                .toString()),
                            Text((_round1.positionnementCombatant2 +
                                    _round2.positionnementCombatant2 +
                                    _round3.positionnementCombatant2)
                                .toString()),
                            Text((_round1.coupQualiteCombatant2 +
                                    _round2.coupQualiteCombatant2 +
                                    _round3.coupQualiteCombatant2)
                                .toString()),
                            Text((_round1.gestionEnergieCombatant2 +
                                    _round2.gestionEnergieCombatant2 +
                                    _round3.gestionEnergieCombatant2)
                                .toString()),
                            Text((_round1.piedCombatant2 +
                                    _round2.piedCombatant2 +
                                    _round3.piedCombatant2)
                                .toString()),
                            Text((_round1.defenseCombatant2 +
                                    _round2.defenseCombatant2 +
                                    _round3.defenseCombatant2)
                                .toString()),
                            Text((_round1.perceptionCombatant2 +
                                    _round2.perceptionCombatant2 +
                                    _round3.perceptionCombatant2)
                                .toString()),
                            Text((_round1.rythmeCombatant2 +
                                    _round2.rythmeCombatant2 +
                                    _round3.rythmeCombatant2)
                                .toString()),
                            Text((_round1.ringCombatant2 +
                                    _round2.ringCombatant2 +
                                    _round3.ringCombatant2)
                                .toString()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
