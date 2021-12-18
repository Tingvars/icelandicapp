import 'package:flutter/material.dart';
import 'dart:math';
import 'library.dart';
import 'firstpage.dart';
import 'quizpage.dart';
import 'gotitrightpage.dart';
import 'gaveuppage.dart';
import 'endpage.dart';

class EndPage extends StatelessWidget {
  //receives rightCounter to display final score:
  int rightCounter;

  EndPage(this.rightCounter);

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
              Image(image: AssetImage('images/vikingcelebrate.png')),
            ),
            Text(
              "Congratulations!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Viking',),
            ),
            Text(
              "You got",
              textAlign: TextAlign.center,
            ),
            Text(
              "$rightCounter / 10",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "correct!",
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
                    //back to firstpage to start new game:
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FirstPage(),
                          ));
                    },
                    child: const Text('Start New Game'),
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