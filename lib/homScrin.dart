import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fair_base_to_do/AboutTheApp.dart';
import 'package:fair_base_to_do/dataBase/dataBaseApp.dart';
import 'package:fair_base_to_do/screen/disain.dart';
import 'package:fair_base_to_do/taskContener.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void showMenuAdded(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: 500,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 130, 255, 113),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Сумма:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Прочее:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty) {
                        await DataBase.addToBase(
                          nameController.text,
                          descriptionController.text,
                          'by',
                        );
                        Navigator.of(context).pop();
                        nameController.clear();
                        descriptionController.clear();
                      }
                    },
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showMenuAdded2(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: 500,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 114, 114),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Сумма:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Прочее:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty) {
                        await DataBase.addToBase(
                          nameController.text,
                          descriptionController.text,
                          'sell',
                        );
                        Navigator.of(context).pop();
                        nameController.clear();
                        descriptionController.clear();
                      }
                    },
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showMenuEdit(
    BuildContext context,
    String id,
    String name,
    String dis,
  ) {
    nameController.text = name;
    descriptionController.text = dis;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: 500,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 151, 151, 151),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Сумма:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Прочее:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty) {
                        await DataBase.updateTask(id, nameController.text,
                            descriptionController.text);
                        Navigator.of(context).pop();
                        nameController.clear();
                        descriptionController.clear();
                      }
                    },
                    child: Text(
                      'Изменить',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deletTaskz(String id) async {
    await DataBase.deleteFronBase(id);
    setState(() {});
  }

  void editTaskz(String id, String name, String des) async {
    await DataBase.updateTask(id, name, des);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Container(
              width: 150,
              child: FloatingActionButton(
                onPressed: () {
                  showMenuAdded(context);
                },
                child: Text(
                  'Доход',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                backgroundColor: const Color.fromARGB(255, 130, 255, 113),
              ),
            ),
            Spacer(),
            Container(
              width: 150,
              child: FloatingActionButton(
                onPressed: () {
                  showMenuAdded2(context);
                },
                child: Text(
                  'Расход',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 114, 114),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Money Counter',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                showAlert(context);
              },
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 0),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/fon.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: taskList(),
      ),
    );
  }

  Widget taskList() {
    return StreamBuilder(
      stream: DataBase.data.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          QuerySnapshot<Object?> list = snapshot.data!;
          final dataList = list.docs;
          return viewTaskList(dataList);
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          );
        }
      },
    );
  }

  Widget viewTaskList(List<QueryDocumentSnapshot<Object?>> tasks) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Map<String, dynamic> t = tasks[index].data() as Map<String, dynamic>;
        return Taskconteiner(
          tipe: t['tipe'],
          edit: () {
            showMenuEdit(
              context,
              t['id'],
              t['task'],
              t['descriphion'],
            );
          },
          delet: () async {
            await deletTaskz(t['id']);
          },
          title: t['task'],
          description: t['descriphion'],
          date: t['date'],
        );
      },
      itemCount: tasks.length,
    );
  }

  showAlert(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 0),
      title: Center(
        child: Text(
          'Настройки',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage(),
                    ),
                  );
                },
                child: Text(
                  'Выйти из акаунта',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Abouttheapp(),
                    ),
                  );
                },
                child: Text(
                  'О приложении',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
