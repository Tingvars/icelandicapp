import 'package:flutter/material.dart';
import 'library.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Icelandic App Stuff'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String enteredWord1 = "";
  String enteredWord2 = "";
  String enteredWord3 = "";
  bool subjectBool = false;
  bool verbBool = false;
  bool objectBool = false;

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

  void checkAnswer() {
    if (subjectBool && verbBool && objectBool) {
      print("All correct!");
    } else {
      print("Not quite there...");
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    List useWords = getWords();
    String isSubject = useWords[0];
    String enSubject = useWords[1];
    String isVerb = useWords[2];
    String enVerb = useWords[3];
    String isObject = useWords[4];
    String enObject = useWords[5];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
                          checkAnswer();
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