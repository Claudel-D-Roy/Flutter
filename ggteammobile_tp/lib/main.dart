import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:ggteammobile_tp/Controllers/boxes.dart';
import 'package:ggteammobile_tp/pages/combat_page.dart';
import 'package:ggteammobile_tp/pages/login_page.dart';
import 'package:ggteammobile_tp/pages/acceuil_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ggteammobile_tp/pages/count_provider.dart';
import 'package:ggteammobile_tp/Controllers/combatant.dart';
import 'package:ggteammobile_tp/Controllers/event.dart';
import 'package:ggteammobile_tp/Controllers/round.dart';
import 'dart:math';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:ggteammobile_tp/Controllers/utilisateur_controleur.dart';
import 'package:ggteammobile_tp/providers/utilisateur_provider.dart';
import 'package:ggteammobile_tp/database/database.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CombatantAdapter());
  Hive.registerAdapter((EventAdapter()));
  Hive.registerAdapter(RoundAdapter());
  boxCombatants = await Hive.openBox<Combatant>('boxCombattants');
  boxEvents = await Hive.openBox<Event>('boxEvents');
  boxRounds = await Hive.openBox<Round>('boxRounds');

  // await Hive.deleteBoxFromDisk('boxCombattants');
  // await Hive.deleteBoxFromDisk('boxEvents');
  // await Hive.deleteBoxFromDisk('boxRounds');

  //Check if the box is empty (assuming you only want to seed once)
  if (boxCombatants.isEmpty) {
    seedCombatants(boxCombatants);
  }
  if (boxEvents.isEmpty) {
    seedEvents(boxEvents);
  }

  printCombatantsAndEvents();


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CountProvider>(
      create: (context) => CountProvider(),
    ),
    // Other providers if needed
  ], child: MyApp()));
}

void printCombatantsAndEvents() {
  // Print Combatants
  print('Combatants:');
  for (var combatant in boxCombatants.values) {
    print('Name: ${combatant.firstName} ${combatant.lastName}');
    print('Sex: ${combatant.sex}');
    // Add any other properties you want to print
  }

  // Print Events
  print('Events:');
  for (var event in boxEvents.values) {
    print('Event Id: ${event.id}');
    print('Event Name: ${event.name}');
    print('Date: ${event.date}');
    print('Selected Weight: ${event.selectedWeight}');
    print('Selected Phase: ${event.selectedPhase}');
    print(
        'Adversaire 1: ${event.adversaire1.firstName} ${event.adversaire1.lastName}');
    print(
        'Adversaire 2: ${event.adversaire2.firstName} ${event.adversaire2.lastName}');

    // Print rounds for the event
    print('Round 1 Comment: ${event.round1.commentaire}');
    print('Round 2 Comment: ${event.round2.commentaire}');
    print('Round 3 Comment: ${event.round3.commentaire}');
  }
}

void seedCombatants(Box box) {
  final random = Random();
  final malefirstNames = [
    'William',
    'Daniel',
    'Joseph',
    'Benjamin',
    'Samuel',
    'Matthew',
    'Christopher',
    'Andrew',
    'Nicholas',
    'Robert'
  ];
  final femaleFirstNames = [
    'Sophia',
    'Isabella',
    'Mia',
    'Charlotte',
    'Ava',
    'Grace',
    'Lily',
    'Zoe',
    'Hannah',
    'Sofia'
  ];
  final lastNames = [
    'Smith',
    'Johnson',
    'Brown',
    'Lee',
    'Wilson',
    'Clark',
    'Thomas',
    'Harris',
    'Young',
    'Walker'
  ];
  final genders = ['Male', 'Female'];

  //males
  for (var i = 0; i < 10; i++) {
    final firstName = malefirstNames[random.nextInt(malefirstNames.length)];
    final lastName = lastNames[random.nextInt(lastNames.length)];
    final fullName = '$firstName $lastName';

    final gender = genders[0];

    final combatant = Combatant(
      firstName: firstName,
      lastName: lastName,
      imagePath: 'assets/images/combattant${i + 1}.jpg',
      sex: gender,
    );

    box.add(combatant);
  }

  //females
  for (var i = 0; i < 10; i++) {
    final firstName = femaleFirstNames[random.nextInt(femaleFirstNames.length)];
    final lastName = lastNames[random.nextInt(lastNames.length)];
    final fullName = '$firstName $lastName';
    final gender = genders[1];

    final combatant = Combatant(
      firstName: firstName,
      lastName: lastName,
      imagePath: 'assets/images/combattant_F${i + 1}.jpg',
      sex: gender,
    );

    box.add(combatant);
  }
}

void seedEvents(Box box) {
  final random = Random();

  final eventNames = [
    'Event 1',
    'Event 2',
    'Event 3',
    'Event 4',
    'Event 5',
    'Event 6',
    'Event 7',
    'Event 8',
    'Event 9',
    'Event 10',
  ];

  final weights = [
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
  ];
  final phases = [
    'N/A',
    'Qualifications',
    'Quart de Finales',
    'Demi-Finales',
    'Finales'
  ];

  // Generate 10 random events
  for (var i = 0; i < 10; i++) {
    final name = eventNames[i];
    final date = '2023-10-18'; // You can set the date as needed.
    final selectedWeight = weights[random.nextInt(weights.length)];
    final selectedPhase = phases[random.nextInt(phases.length)];
    final adversaire1 = boxCombatants.values
        .elementAt(i); // Assuming you have 10 combatants in boxCombatants
    final adversaire2 = boxCombatants.values
        .elementAt(i + 10); // Assuming you have 10 combatants in boxCombatants

    final round1 = Round(
      dominationCombatant1: random.nextInt(6),
      dominationCombatant2: random.nextInt(6),
      vulnerabiliteCombatant1: random.nextInt(6),
      vulnerabiliteCombatant2: random.nextInt(6),
      positionnementCombatant1: random.nextInt(6),
      positionnementCombatant2: random.nextInt(6),
      coupQualiteCombatant1: random.nextInt(6),
      coupQualiteCombatant2: random.nextInt(6),
      gestionEnergieCombatant1: random.nextInt(6),
      gestionEnergieCombatant2: random.nextInt(6),
      piedCombatant1: random.nextInt(6),
      piedCombatant2: random.nextInt(6),
      defenseCombatant1: random.nextInt(6),
      defenseCombatant2: random.nextInt(6),
      perceptionCombatant1: random.nextInt(6),
      perceptionCombatant2: random.nextInt(6),
      rythmeCombatant1: random.nextInt(6),
      rythmeCombatant2: random.nextInt(6),
      ringCombatant1: random.nextInt(6),
      ringCombatant2: random.nextInt(6),
      commentaire: 'Round 1 Comment',
    );

    final round2 = Round(
      dominationCombatant1: random.nextInt(6),
      dominationCombatant2: random.nextInt(6),
      vulnerabiliteCombatant1: random.nextInt(6),
      vulnerabiliteCombatant2: random.nextInt(6),
      positionnementCombatant1: random.nextInt(6),
      positionnementCombatant2: random.nextInt(6),
      coupQualiteCombatant1: random.nextInt(6),
      coupQualiteCombatant2: random.nextInt(6),
      gestionEnergieCombatant1: random.nextInt(6),
      gestionEnergieCombatant2: random.nextInt(6),
      piedCombatant1: random.nextInt(6),
      piedCombatant2: random.nextInt(6),
      defenseCombatant1: random.nextInt(6),
      defenseCombatant2: random.nextInt(6),
      perceptionCombatant1: random.nextInt(6),
      perceptionCombatant2: random.nextInt(6),
      rythmeCombatant1: random.nextInt(6),
      rythmeCombatant2: random.nextInt(6),
      ringCombatant1: random.nextInt(6),
      ringCombatant2: random.nextInt(6),
      commentaire: 'Round 2 Comment',
    );

    final round3 = Round(
      dominationCombatant1: random.nextInt(6),
      dominationCombatant2: random.nextInt(6),
      vulnerabiliteCombatant1: random.nextInt(6),
      vulnerabiliteCombatant2: random.nextInt(6),
      positionnementCombatant1: random.nextInt(6),
      positionnementCombatant2: random.nextInt(6),
      coupQualiteCombatant1: random.nextInt(6),
      coupQualiteCombatant2: random.nextInt(6),
      gestionEnergieCombatant1: random.nextInt(6),
      gestionEnergieCombatant2: random.nextInt(6),
      piedCombatant1: random.nextInt(6),
      piedCombatant2: random.nextInt(6),
      defenseCombatant1: random.nextInt(6),
      defenseCombatant2: random.nextInt(6),
      perceptionCombatant1: random.nextInt(6),
      perceptionCombatant2: random.nextInt(6),
      rythmeCombatant1: random.nextInt(6),
      rythmeCombatant2: random.nextInt(6),
      ringCombatant1: random.nextInt(6),
      ringCombatant2: random.nextInt(6),
      commentaire: 'Round 3 Comment',
    );

    final event = Event(
      id: i,
      name: name,
      date: date,
      selectedWeight: selectedWeight,
      selectedPhase: selectedPhase,
      adversaire1: adversaire1,
      adversaire2: adversaire2,
      round1: round1,
      round2: round2,
      round3: round3,
    );

    box.add(event);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  late DatabaseHandler _db;

  @override
  void initState() {
    super.initState();

    _db = DatabaseHandler();

    if(_db.database == null) {
      isLoading = true;
      // _deleteDatabase();
      _initDatabase();
    } else {
      isLoading = false;
    }
  }

  void _initDatabase() async {
    await _db.initDb();

    setState(() {
      isLoading = false;
    });
  }

  // void _deleteDatabase() async {
  //   await _db.deleteDatabase();

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UtilisateurProvider(Auth0('dev-4hw4ufyovc5dunvi.us.auth0.com', '7K29HSYoyzdNfg3G6orfLBqaWvADANP3'), Auth0Web('dev-4hw4ufyovc5dunvi.us.auth0.com', '7K29HSYoyzdNfg3G6orfLBqaWvADANP3'), UtilisateurControleur()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Consumer<UtilisateurProvider>(
              builder: (context, utilisateurProvider, child) {
                return Center(
                    child: utilisateurProvider.isAuthenticating
                        ? const CircularProgressIndicator()
                        : utilisateurProvider.isLoggedIn
                        ? AcceuilPage()
                        : LoginPage()
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}