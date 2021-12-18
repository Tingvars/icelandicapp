import 'package:flutter/material.dart';
import 'dart:math';
import 'library.dart';
import 'firstpage.dart';
import 'quizpage.dart';
import 'gotitrightpage.dart';
import 'gaveuppage.dart';
import 'endpage.dart';

class GaveUpPage extends StatelessWidget {
  //passing on the current counters, plus the sentences used in the last game:
  int turnCounter;
  int rightCounter;
  String enSentence;
  String isSentence;
  bool hintsOn;
  String enteredWord1;
  String enteredWord2;
  String enteredWord3;

  GaveUpPage(this.turnCounter, this.rightCounter, this.enSentence, this.isSentence, this.hintsOn, this.enteredWord1, this.enteredWord2, this.enteredWord3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 150,
              ),
              child:
              Image(image: AssetImage('images/vikingintro.png')),
            ),
            Text(
              enSentence,
              textAlign: TextAlign.center,
            ),
            //what the user typed:
            Text(
              "Your answer: $enteredWord1 $enteredWord2 $enteredWord3",
              textAlign: TextAlign.center,
            ),
            //what the user should have typed:
            Text(
              "Correct answer: $isSentence",
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
                      //checks if this is turn 10, if so ends game:
                      if (turnCounter > 8) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EndPage(rightCounter),
                            ));
                      } else {
                        //adds 1 to turn counter and starts new quizpage:
                        turnCounter = turnCounter + 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage(turnCounter, rightCounter, hintsOn),
                            ));
                      }
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