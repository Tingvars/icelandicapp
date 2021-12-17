import 'package:flutter/material.dart';
import 'dart:math';
import 'library.dart';
import 'firstpage.dart';
import 'quizpage.dart';
import 'gotitrightpage.dart';
import 'gaveuppage.dart';
import 'endpage.dart';

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
                maxHeight: 120,
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
                      onChanged: (text) {
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
                        onChanged: (text) {
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
                        onChanged: (text) {
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
                                  builder: (context) => GotItRightPage(turnCounter, rightCounter, "$enSubject $enVerb $enObject", "$isSubject $isVerb $isObject", hintsOn, enteredWord1, enteredWord2, enteredWord3),
                                ));
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text('Not quite!', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Keep trying'),
                                      child: const Text('Keep trying', style: TextStyle(fontSize: 16)),
                                    ),

                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GaveUpPage(turnCounter, rightCounter, "$enSubject $enVerb $enObject", "$isSubject $isVerb $isObject", hintsOn, enteredWord1, enteredWord2, enteredWord3),
                                          ));
                                    },
                                    child: const Text('Give up', style: TextStyle(fontSize: 16)),
                                  ),
                              ],
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