import 'package:flutter/material.dart';
import 'dart:math';
import 'library.dart';
import 'firstpage.dart';
import 'quizpage.dart';
import 'gotitrightpage.dart';
import 'gaveuppage.dart';
import 'endpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "GRAMMAR VIKING",
                textAlign: TextAlign.center,
                 style: TextStyle(fontFamily: 'Viking', fontSize: 29, color: Colors.brown[700]),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 120,
              ),
              child:
              Image(image: AssetImage('images/vikingintro.png')),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Show IS hints?",
                    textAlign: TextAlign.center,
                  ),
                ),
                //The following toggles isChecked for passing on to quizpage
                Container(
                  child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }
                  ),
                ),
              ],
            ),
            Text(
              "Tick this box to see the undeclined forms of the Icelandic words - or leave it unticked to test your vocabulary!",
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  width: 150.0,
                  height: 50.0,
                  color: Colors.amber[600],
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            //The 0s are values for turnCounter and rightCounter, to reset them when new game starts:
                            builder: (context) => QuizPage(0, 0, isChecked),
                          ));
                    },
                    child: const Text('Start Game'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}