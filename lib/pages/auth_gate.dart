import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:capstone_project/pages/home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: SignInScreen(
                headerBuilder: (context, constraints, _) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                        25,
                      )),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset('assets/images/download.png'),
                      ),
                    ),
                  );
                },
                providerConfigs: const [
                  EmailProviderConfiguration(),
                ],
                footerBuilder: (context, _) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 280),
                    child: Text(
                      'By signing in, you agree to our terms and conditions.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            );
          }

          return const Home();
        },
      ),
    );
  }
}
