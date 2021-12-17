import 'package:flutter/material.dart';
import 'dart:math';
import 'library.dart';
import 'firstpage.dart';
import 'quizpage.dart';
import 'gotitrightpage.dart';
import 'gaveuppage.dart';
import 'endpage.dart';

class GotItRightPage extends StatelessWidget {
  int turnCounter;
  int rightCounter;
  String enSentence;
  String isSentence;
  bool hintsOn;
  String enteredWord1;
  String enteredWord2;
  String enteredWord3;

  GotItRightPage(this.turnCounter, this.rightCounter, this.enSentence, this.isSentence, this.hintsOn, this.enteredWord1, this.enteredWord2, this.enteredWord3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 200,
              ),
              child:
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image(image: AssetImage('images/vikinghappy.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "That's right!",
                textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              enSentence,
              textAlign: TextAlign.center,
            ),
            Text(
              isSentence,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
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
                      rightCounter = rightCounter + 1;
                      if (turnCounter > 8) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EndPage(turnCounter, rightCounter, hintsOn),
                            ));
                      } else {
                        turnCounter = turnCounter + 1;
                        print(turnCounter);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage(turnCounter, rightCounter, hintsOn),
                            ));
                      };
                    },
                    child: const Text('Continue ->'),
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