import 'package:flutter/material.dart';
import 'package:capstone_project/route/route.dart' as route;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const FlutterLogo(
            size: 54,
          ),
          Text('Flutter dev'),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              })
        ]),
      ),
      drawer: Drawer(),
    );
  }
}

void showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text('OK'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('Info'),
    content: Text(
        "This app was developed in the Mobile Application course.  It connects to a Firebase back-end and uses Firebase Auth for authentication."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
