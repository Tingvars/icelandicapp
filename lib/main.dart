import 'package:flutter/material.dart';
import 'library.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFCF788)),
    home: FirstPage(),
  ),
  );
}

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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "WELCOME TO GRAMMAR VIKING",
                textAlign: TextAlign.center,
              ),
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 200,
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
              Container(
                child: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
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


class QuizPage extends StatelessWidget {
  String enteredWord1 = "";
  String enteredWord2 = "";
  String enteredWord3 = "";
  bool subjectBool = false;
  bool verbBool = false;
  bool objectBool = false;
  int turnCounter;
  int rightCounter;
  bool hintsOn;

  QuizPage(this.turnCounter, this.rightCounter, this.hintsOn);

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
    String isHelpSubject = subject.islSubjList[subjNum][innerSubjNum];
    int verbNum = getRandomListItem(verbs);
    String isVerb = verbs[verbNum].islVerbList[subjNum];
    String enVerb = verbs[verbNum].engVerbList[subjNum];
    String isHelpVerb = verbs[verbNum].islVerbList[5];
    String verbCase = verbs[verbNum].caseCaused;
    Object object = Object(verbCase);
    int objectNum = object.getObjectNum();
    int objectForm = object.getObjectForm(objectNum);
    String isObject = object.objList[objectNum][0][objectForm][object.caseInt];
    String enObject = object.objList[objectNum][1][objectForm][object.caseInt];
    String isHelpObject = object.objList[objectNum][0][objectForm][0];
    return [
      isSubject,
      enSubject,
      isVerb,
      enVerb,
      isObject,
      enObject,
      isHelpSubject,
      isHelpVerb,
      isHelpObject
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

  String getSubjectLabel(String isS, String enS) {
    if (hintsOn) {
      return isS;
    } else {
      return enS;
    }
  }

  String getVerbLabel(String isV, String enV) {
    if (hintsOn) {
      return isV;
    } else {
      return enV;
    }
  }

  String getObjectLabel(String isO, String enO) {
    if (hintsOn) {
      return isO;
    } else {
      return enO;
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
    String isHelpSubject = useWords[6];
    String isHelpVerb = useWords[7];
    String isHelpObject = useWords[8];
    String subjectLabel = enSubject;
    String verbLabel = enVerb;
    String objectLabel = enObject;

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 70,
              ),
              child:
              Image(image: AssetImage('images/vikingthinking.png')),
            ),
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
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: getSubjectLabel(isHelpSubject, enSubject),
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
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: getVerbLabel(isHelpVerb, enVerb),
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
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: getObjectLabel(isHelpObject, enObject),
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
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          if (subjectBool && verbBool && objectBool) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GotItRightPage(turnCounter, rightCounter, "$enSubject $enVerb $enObject", "$isSubject $isVerb $isObject", hintsOn),
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
                          builder: (context) => GaveUpPage(turnCounter, rightCounter, "$enSubject $enVerb $enObject", "$isSubject $isVerb $isObject", hintsOn),
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
  int rightCounter;
  String enSentence;
  String isSentence;
  bool hintsOn;

  GotItRightPage(this.turnCounter, this.rightCounter, this.enSentence, this.isSentence, this.hintsOn);

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
              Image(image: AssetImage('images/vikinghappy.png')),
            ),
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

class GaveUpPage extends StatelessWidget {
  int turnCounter;
  int rightCounter;
  String enSentence;
  String isSentence;
  bool hintsOn;

  GaveUpPage(this.turnCounter, this.rightCounter, this.enSentence, this.isSentence, this.hintsOn);

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
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
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

class EndPage extends StatelessWidget {
  int turnCounter;
  int rightCounter;
  bool hintsOn;

  EndPage(this.turnCounter, this.rightCounter, this.hintsOn);

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
              "Congratulations! You got",
              textAlign: TextAlign.center,
            ),
            Text(
              "$rightCounter / 10",
              textAlign: TextAlign.center,
            ),
            Text(
              "correct",
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
                      turnCounter = 0;
                      rightCounter = 0;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(turnCounter, rightCounter, hintsOn),
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