import 'package:flutter/material.dart';
import 'library.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: FirstPage(),
  ),
  );
}

class FirstPage extends StatelessWidget {
  int turnCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First page",
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
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(turnCounter),
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

class QuizPage extends StatelessWidget {
  String enteredWord1 = "";
  String enteredWord2 = "";
  String enteredWord3 = "";
  bool subjectBool = false;
  bool verbBool = false;
  bool objectBool = false;
  int turnCounter;

  QuizPage(this.turnCounter);

  int getRandomListItem(list) {
    Random random = Random();
    int subjRandomNumber = random.nextInt(list.length);
    return subjRandomNumber;
  }

  List getWords() {
    Subject subject = Subject();
    int subjNum = subject.getSubjectNum();
    int innerSubjNum = subject.getInnerSubjectNum(subjNum);
    String isSubject = subject.islSubjList[subjNum][innerSubjNum];
    String enSubject = subject.engSubjList[subjNum][innerSubjNum];
    int verbNum = getRandomListItem(verbs);
    String isVerb = verbs[verbNum].islVerbList[subjNum];
    String enVerb = verbs[verbNum].engVerbList[subjNum];
    String verbCase = verbs[verbNum].caseCaused;
    Object object = Object(verbCase);
    int objectNum = object.getObjectNum();
    int objectForm = object.getObjectForm(objectNum);
    String isObject = object.objList[objectNum][0][objectForm][object.caseInt];
    String enObject = object.objList[objectNum][1][objectForm][object.caseInt];
    return [
      isSubject,
      enSubject,
      isVerb,
      enVerb,
      isObject,
      enObject
    ];
  }

  void checkEntry1(String isSubject) {
    if (enteredWord1 == isSubject) {
      subjectBool = true;
    } else {
      subjectBool = false;
    }
  }

  void checkEntry2(String isVerb) {
    if (enteredWord2 == isVerb) {
      verbBool = true;
    } else {
      verbBool = false;
    }
  }

  void checkEntry3(String isObject) {
    if (enteredWord3 == isObject) {
      objectBool = true;
    } else {
      objectBool = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    List useWords = getWords();
    String isSubject = useWords[0];
    String enSubject = useWords[1];
    String isVerb = useWords[2];
    String enVerb = useWords[3];
    String isObject = useWords[4];
    String enObject = useWords[5];

    return Scaffold(
      appBar: AppBar(
        title: Text("Icelandic app stuff"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 100,
                    child: Text(
                      enSubject,
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(
                  width: 100,
                  child: Text(
                    enVerb,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    enObject,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextField(
                      onSubmitted: (text) {
                        enteredWord1 = text;
                        checkEntry1(isSubject);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: isSubject,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextField(
                        onSubmitted: (text) {
                          enteredWord2 = text;
                          checkEntry2(isVerb);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: isVerb,
                        )),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextField(
                        onSubmitted: (text) {
                          enteredWord3 = text;
                          checkEntry3(isObject);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: isObject,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
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
                          primary: Colors.red,
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          if (subjectBool && verbBool && objectBool) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GotItRightPage(turnCounter, "$enSubject $enVerb $enObject", "$isSubject $isVerb $isObject"),
                                ));
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text('Not quite!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Keep trying'),
                                    child: const Text('Keep trying'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => GaveUpPage(turnCounter, "$enSubject $enVerb $enObject", "$isSubject $isVerb $isObject"),
                          ));
                          },
                                    child: const Text('Give up'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('Check Answer'),
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
}

class GotItRightPage extends StatelessWidget {
  int turnCounter;
  String enSentence;
  String isSentence;

  GotItRightPage(this.turnCounter, this.enSentence, this.isSentence);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "That's right!",
                textAlign: TextAlign.center,
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
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      turnCounter = turnCounter + 1;
                      print(turnCounter);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(turnCounter),
                          ));
                    },
                    child: const Text('Start again'),
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

class GaveUpPage extends StatelessWidget {
  int turnCounter;
  String enSentence;
  String isSentence;

  GaveUpPage(this.turnCounter, this.enSentence, this.isSentence);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              enSentence,
              textAlign: TextAlign.center,
            ),
            Text(
              isSentence,
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
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      turnCounter = turnCounter + 1;
                      print(turnCounter);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(turnCounter),
                          ));
                    },
                    child: const Text('Start again'),
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