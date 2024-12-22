import 'package:fair_base_to_do/dataBase/auth_api.dart';
import 'package:fair_base_to_do/homScrin.dart';
import 'package:fair_base_to_do/screen/disain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthApi.auth.authStateChanges(),
        builder: (context, snap) {
          if (snap.hasData) {
            return Home();
          } else {
            return RegistrationPage();
          }
        },
      ),
    );
  }
}
