import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase {
  static final CollectionReference data = FirebaseFirestore.instance
      .collection('User')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Tasks');

  static List<String> mounths = [
    "Январь",
    "Февраль",
    "Март",
    "Апрель",
    "Май",
    "Июнь",
    "Июль",
    "Август",
    "Сентябрь",
    "Октябрь",
    "Ноябрь",
    "Декабрь",
  ];

  static Future<void> addToBase(
      String name, String descriphion, String tipe) async {
    DateTime newDate = DateTime.now();

    await FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Tasks')
        .doc(
          newDate.millisecondsSinceEpoch.toString(),
        )
        .set(
      {
        "task": name,
        "descriphion": descriphion,
        "tipe": tipe,
        "date": "${mounths[newDate.month - 1]} ${newDate.day}, ${newDate.year}",
        'id': '${newDate.millisecondsSinceEpoch}',
      },
    );
  }

  static Future<void> deleteFronBase(String id) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Tasks')
        .doc(
          id,
        )
        .delete();
  }

  static Future<void> updateTask(String id, String name, String des) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Tasks')
        .doc(
          id,
        )
        .update(
      {
        'task': name,
        "descriphion": des,
      },
    );
  }
}
