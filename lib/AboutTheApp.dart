import 'package:flutter/material.dart';

class Abouttheapp extends StatefulWidget {
  const Abouttheapp({super.key});

  @override
  State<Abouttheapp> createState() => _AbouttheappState();
}

class _AbouttheappState extends State<Abouttheapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 0),
        title: Center(
          child: Text(
            'About The App',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/fon.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'This application is designed to take into account your financial literacy. Technical support: illarionov347@gmail.com Sincerely, Artem Illarionov!',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '''Privacy Policy for the mobile app
This Privacy Policy for the mobile application (hereinafter — 
The Policy) applies to the information that
the Limited Liability Company "Brokercreditservice Company" (OGRN:
347280347280; TIN: 347280347280, address: 347280, Novosibirsk, Sovetskaya str
., 347280) (hereinafter – the Company) can receive from the user's device during 
their use of a mobile application to access the BCS Online System
(hereinafter referred to as the Application). 
Using the Application means the user's unconditional consent to
this Policy and the conditions specified in it for processing information
received from the user's device. In case of disagreement with the Policy
, the user must refrain from using the Application. 
The Application and services within the Application allow the user to
interact with the Company on the basis of concluded contracts and agreements with 
Companies that, among other things, regulate.''',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
