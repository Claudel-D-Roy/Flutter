import 'package:flutter/material.dart';
import '../Controllers/round.dart';
import 'animated_bar.dart';
import 'package:provider/provider.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:ggteammobile_tp/pages/roundpage.dart';
import 'package:ggteammobile_tp/Controllers/boxes.dart';
import 'package:ggteammobile_tp/Controllers/event.dart';
import 'package:ggteammobile_tp/providers/utilisateur_provider.dart';

class CombatPage extends StatefulWidget {
  const CombatPage({super.key, required this.id});
  final int id;

  @override
  State<CombatPage> createState() => _CombatPageState();
}

class _CombatPageState extends State<CombatPage> {
   late Event _event; // Declare a variable to hold the event
   late Round _round1;
   late Round _round2;
   late Round _round3;

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

    setState(() {}); // Update the UI with the loaded event
  }

  void saveEvent(Event event) async {
    print(event.round1.dominationCombatant1);
    await boxEvents.putAt(event.id, event);
    print(":save event:");
    print(event.round1.dominationCombatant1);
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<UtilisateurProvider> (
        builder: (context, utilisateurProvider, child) {
          return WillPopScope(
      onWillPop: () async {
        print(":will pop scope:");
        saveEvent(_event);
        return true;
      },  
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_event.name),
            bottom: TabBar(
              tabs: [
                Tab(text: "Round 1"),
                Tab(text: "Round 2"),
                Tab(text: "Round 3"),
              ],
            ),
          ),
          body: utilisateurProvider.isLoggedIn && utilisateurProvider.hasRole("admin") 
          ? TabBarView(
            children: [
              RoundPage(_event, _event.round1, 1),
              RoundPage(_event, _event.round2, 2),
              RoundPage(_event, _event.round3, 3),
            ],
          )
          : Text("Vous n'avez pas le droit de voir ceci"),
        ),
      )
    );
        }
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LinearProgressIndicatorClass extends StatefulWidget {
  @override
  _LinearProgressIndicatorClassState createState() =>
      _LinearProgressIndicatorClassState();
}

class _LinearProgressIndicatorClassState
    extends State<LinearProgressIndicatorClass> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_rounded),
        onPressed: () {
          setState(() {
            loading = !loading;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Center(
          child: loading
              ? LinearProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                )
              : Text(
                  "Loading ...",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
