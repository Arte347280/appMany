import 'package:fair_base_to_do/dataBase/auth_api.dart';
import 'package:fair_base_to_do/homScrin.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRegistrate = true;
  Future<void> registrete() async {
    bool result =
        await AuthApi.register(emailController.text, passwordController.text);
    if (result == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  Future<void> login() async {
    bool result =
        await AuthApi.loginUser(emailController.text, passwordController.text);
    if (result == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  bool showPasworld = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/fon.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(),
                SizedBox(height: 30.0),
                InputUser(),
                SizedBox(height: 24.0),
                Button(),
                SizedBox(height: 15),
                ButtonText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TitleText() {
    return Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: Text(
        isRegistrate == true ? 'Регистрация' : 'Вохд',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget InputUser() {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Почта',
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: passwordController,
                obscureText: !showPasworld,
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  showPasworld = !showPasworld;
                });
              },
              icon: Icon(
                showPasworld ? Icons.visibility_off : Icons.visibility,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ButtonText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isRegistrate == true ? 'Уже есть акаунт?' : 'Ещё нет акаунта?',
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 16.0,
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              isRegistrate = !isRegistrate;
            });
          },
          child: Text(
            isRegistrate == true ? 'Войти' : 'Зарегистрироватся',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget Button() {
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          isRegistrate == true ? registrete() : login();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Далее',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
