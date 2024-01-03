import 'package:flutter/material.dart';
import 'package:ggteammobile_tp/Controllers/event.dart';
import 'package:ggteammobile_tp/Controllers/round.dart';
import 'package:ggteammobile_tp/pages/progress_bar.dart';

import '../Controllers/boxes.dart';

class AnimatedBar extends StatefulWidget {
  final int field1;
  final int field2;
  final int categoryId;
  final int roundId;
  final Event event;

  const AnimatedBar(
      {Key? key, required this.field1, required this.field2, required this.categoryId, required this.roundId, required this.event})
      : super(key: key);

  @override
  State<AnimatedBar> createState() =>
      _AnimatedBarState(
          field1: field1,
          field2: field2,
          categoryId: categoryId,
          roundId: roundId,
          event: event);
}

class _AnimatedBarState extends State<AnimatedBar>
    with TickerProviderStateMixin {

  int categoryId;
  int field1;
  int field2;
  int roundId;
  Event event;
  Animation<double>? _field1Animation;
  AnimationController? _field1AnimationController;
  AnimationController? _couponAnimationController;

  _AnimatedBarState(
      {required this.field1, required this.field2, required this.categoryId, required this.roundId, required this.event});

  void _incrementCounter() {
    setState(() {
      field2++;
    });
  }

  void _decrementCounter() {
    setState(() {
      field2--;
    });
  }

  @override
  void initState() {
    super.initState();
    this._field1AnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..addListener(() async {
        if (this._field1AnimationController!.isAnimating) {
          setState(() {
            field1 = this._field1Animation!.value.toInt();
          });
        }
        if (this._field1AnimationController!.isCompleted) {
          setState(() {
            field1 = this._field1Animation!.value.toInt();
          });
        }
      });
    this._couponAnimationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 600))
      ..addListener(() {
        if (this._couponAnimationController!.isAnimating)
          this.setState(() {});
      });
    final double _count = field1.toDouble();
    this._field1Animation = Tween<double>(begin: _count, end: _count + 1)
        .animate(this._field1AnimationController!);
  }

  void saveEvent() async {
    print("event saved");

    if (roundId == 1) {
      switch(categoryId) {
      case 0:
        event.round1.dominationCombatant1 = field1;
        event.round1.dominationCombatant2 = field2;
        break;
      case 1:
        event.round1.vulnerabiliteCombatant1 = field1;
        event.round1.vulnerabiliteCombatant2 = field2;
        break;
      case 2:
        event.round1.positionnementCombatant1 = field1;
        event.round1.positionnementCombatant2 = field2;
        break;
      case 3:
        event.round1.coupQualiteCombatant1 = field1;
        event.round1.coupQualiteCombatant1 = field2;
        break;
      case 4:
        event.round1.gestionEnergieCombatant1 = field1;
        event.round1.gestionEnergieCombatant2 = field2;
        break;
      case 5:
        event.round1.piedCombatant1 = field1;
        event.round1.piedCombatant2 = field2;
        break;
      case 6:
        event.round1.defenseCombatant1 = field1;
        event.round1.defenseCombatant2 = field2;
        break;
      case 7:
        event.round1.perceptionCombatant1 = field1;
        event.round1.perceptionCombatant2 = field2;
        break;
      case 8:
        event.round1.rythmeCombatant1 = field1;
        event.round1.rythmeCombatant2 = field2;
        break;
      case 9:
        event.round1.ringCombatant1 = field1;
        event.round1.ringCombatant2 = field2;
        break;
      }
    }
    if (roundId == 2) {
      switch(categoryId) {
        case 0:
          event.round2.dominationCombatant1 = field1;
          event.round2.dominationCombatant2 = field2;
          break;
        case 1:
          event.round2.vulnerabiliteCombatant1 = field1;
          event.round2.vulnerabiliteCombatant2 = field2;
          break;
        case 2:
          event.round2.positionnementCombatant1 = field1;
          event.round2.positionnementCombatant2 = field2;
          break;
        case 3:
          event.round2.coupQualiteCombatant1 = field1;
          event.round2.coupQualiteCombatant1 = field2;
          break;
        case 4:
          event.round2.gestionEnergieCombatant1 = field1;
          event.round2.gestionEnergieCombatant2 = field2;
          break;
        case 5:
          event.round2.piedCombatant1 = field1;
          event.round2.piedCombatant2 = field2;
          break;
        case 6:
          event.round2.defenseCombatant1 = field1;
          event.round2.defenseCombatant2 = field2;
          break;
        case 7:
          event.round2.perceptionCombatant1 = field1;
          event.round2.perceptionCombatant2 = field2;
          break;
        case 8:
          event.round2.rythmeCombatant1 = field1;
          event.round2.rythmeCombatant2 = field2;
          break;
        case 9:
          event.round2.ringCombatant1 = field1;
          event.round2.ringCombatant2 = field2;
          break;
      }
    }
    if (roundId == 3) {
      switch(categoryId) {
        case 0:
          event.round3.dominationCombatant1 = field1;
          event.round3.dominationCombatant2 = field2;
          break;
        case 1:
          event.round3.vulnerabiliteCombatant1 = field1;
          event.round3.vulnerabiliteCombatant2 = field2;
          break;
        case 2:
          event.round3.positionnementCombatant1 = field1;
          event.round3.positionnementCombatant2 = field2;
          break;
        case 3:
          event.round3.coupQualiteCombatant1 = field1;
          event.round3.coupQualiteCombatant1 = field2;
          break;
        case 4:
          event.round3.gestionEnergieCombatant1 = field1;
          event.round3.gestionEnergieCombatant2 = field2;
          break;
        case 5:
          event.round3.piedCombatant1 = field1;
          event.round3.piedCombatant2 = field2;
          break;
        case 6:
          event.round3.defenseCombatant1 = field1;
          event.round3.defenseCombatant2 = field2;
          break;
        case 7:
          event.round3.perceptionCombatant1 = field1;
          event.round3.perceptionCombatant2 = field2;
          break;
        case 8:
          event.round3.rythmeCombatant1 = field1;
          event.round3.rythmeCombatant2 = field2;
          break;
        case 9:
          event.round3.ringCombatant1 = field1;
          event.round3.ringCombatant2 = field2;
          break;
      }
    }
    await boxEvents.putAt(event.id, event);
  }

  @override
  void dispose() {
    this._field1AnimationController?.dispose();
    this._couponAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () async {
                  if (field1 == 0) return;
                  this._field1Animation =
                      Tween<double>(
                          begin: field1.toDouble(), end: field1.toDouble() - 1)
                          .animate(this._field1AnimationController!);
                  this._field1AnimationController?.reset();
                  await this._field1AnimationController!.forward();
                  print("moins");
                  saveEvent();
                },
                padding: EdgeInsets.zero,
                iconSize: 24.0,
              ),
            ),
            Expanded(
              flex: 8,
              child: Text(""),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () async {
                  if (field2 == 0) return;
                  _decrementCounter();
                  print("moins");
                  saveEvent();
                },
                padding: EdgeInsets.zero,
                iconSize: 24.0,
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: ProgressBar(count: field1, counter: field2),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  if (field1 == 5) return;
                  this._field1Animation =
                      Tween<double>(begin: field1.toDouble(),
                          end: (field1.toDouble() + 1))
                          .animate(this._field1AnimationController!);
                  this._field1AnimationController?.reset();
                  await this._field1AnimationController!.forward();
                  print("plus");
                  saveEvent();
                },
                padding: EdgeInsets.zero,
                iconSize: 24.0,
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  print("plus");
                  if (field2 >= 5) return;
                  _incrementCounter();
                  saveEvent();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

