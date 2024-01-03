import 'package:flutter/material.dart';
import 'package:ggteammobile_tp/pages/acceuil_page.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../providers/utilisateur_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  late Box box1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Centered Icon
            Icon(
              Icons.account_circle,
              size: 120.0,
              color: Colors.white,
            ),
            SizedBox(height: 20.0),
            Container(
              constraints: BoxConstraints(
                maxWidth: 500.0, // Maximum width of 500 pixels
                minWidth: 0.0,
              ),
              width: MediaQuery.of(context).size.width * 0.9, // 90% of device width
              child: ElevatedButton(
                onPressed: () async {
                  await loginAction();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  } 

  Future<void> loginAction() async {
    try {
      await Provider.of<UtilisateurProvider>(context, listen: false).loginAction();
    } catch (e, s) {
      debugPrint('login with credentials error: $e - stack: $s');
    }
  }
}

