import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthApi {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> register(String email, String pasword) async {
    try {
      UserCredential credit = await auth.createUserWithEmailAndPassword(
          email: email, password: pasword);

      await firestore.collection('User').doc(credit.user!.uid).set({
        'id': credit.user!.uid,
        'email': email,
        'pasword': pasword,
        'created': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      log('Registor : ошибка регистрации $e');
      return false;
    }
  }

  static Future<bool> loginUser(String email, String pasword) async {
    try {
      UserCredential User = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pasword);
      log('User вошёл!');

      return true;
    } catch (e) {
      log('Ошибка входа! $e');
      return false;
    }
  }

  static Future<void> singOutUser() async {}
}
