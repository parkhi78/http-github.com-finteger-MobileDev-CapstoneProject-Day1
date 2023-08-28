import 'package:flutter/material.dart';
import 'package:capstone_project/route/route.dart' as route;
import 'package:capstone_project/pages/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.authGate,
    );
  }
}
