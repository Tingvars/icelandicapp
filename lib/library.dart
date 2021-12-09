//0 = 1p sing, 1 = 2p sing, 2 = 3p sing, 3 = 1p plur, 4 = 2p plur, 5 = 3p plur
import 'dart:math';

List<String> sing1pis = ["Ég"];
List<String> sing2pis = ["Þú"];
List<String> sing3pis = ["Hann", "Hún", "Það"];
List<String> plur1pis = ["Við"];
List<String> plur2pis = ["Þið"];
List<String> plur3pis = ["Þeir", "Þær", "Þau"];
List<String> sing1pen = ["I"];
List<String> sing2pen = ["You"];
List<String> sing3pen = ["He", "She", "It"];
List<String> plur1pen = ["We"];
List<String> plur2pen = ["You"];
List<String> plur3pen = ["They"];

class Subject {
  List<List> islSubjList = [
    sing1pis,
    sing2pis,
    sing3pis,
    plur1pis,
    plur2pis,
    plur3pis,
  ];

  List<List> engSubjList = [
    sing1pen,
    sing2pen,
    sing3pen,
    plur1pen,
    plur2pen,
    plur3pen,
  ];

  int getRandomListItem(list) {
    Random random = new Random();
    int subjRandomNumber = random.nextInt((list.length -1));
    return subjRandomNumber;
  }

  int getSubjectNum() {
    int subjNum = getRandomListItem(islSubjList);
    return subjNum;
  }

  int getInnerSubjectNum(int sub) {
    int innerSubjNum;
    if (islSubjList[sub].length == 1) {
      innerSubjNum = 0;
    } else {
      innerSubjNum = getRandomListItem(islSubjList[sub]);
    }
    return innerSubjNum;
  }

}

List<Verb> verbs = [
  hjalpa,
  horfaa,
  talavid,
  hitta,
  henda,
  sakna
];

class Verb {
  List<String> islVerbList;
  List<String> engVerbList;
  String caseCaused;

  Verb(this.islVerbList, this.engVerbList, this.caseCaused);
}

Verb hjalpa = new Verb([
  "hjálpa",
  "hjálpar",
  "hjálpar",
  "hjálpum",
  "hjálpið",
  "hjálpa",
], [
  "help",
  "help",
  "helps",
  "help",
  "help",
  "help",
], "dat");
Verb horfaa = new Verb([
  "horfi á",
  "horfir á",
  "horfir á",
  "horfum á",
  "horfið á",
  "horfa á",
], [
  "watch",
  "watch",
  "watches",
  "watch",
  "watch",
  "watch",
], "acc");
Verb talavid = new Verb([
  "tala við",
  "talar við",
  "talar við",
  "tölum við",
  "talið við",
  "tala við",
], [
  "talk to",
  "talk to",
  "talks to",
  "talk to",
  "talk to",
  "talk to",
], "acc");
Verb hitta = new Verb([
  "hitti",
  "hittir",
  "hittir",
  "hittum",
  "hittið",
  "hitta",
], [
  "meet",
  "meet",
  "meets",
  "meet",
  "meet",
  "meet",
], "acc");
Verb henda = new Verb([
  "hendi",
  "hendir",
  "hendir",
  "hendum",
  "hendið",
  "henda",
], [
  "throw",
  "throw",
  "throws",
  "throw",
  "throw",
  "throw",
], "dat");
Verb sakna = new Verb([
  "sakna",
  "saknar",
  "saknar",
  "söknum",
  "saknið",
  "sakna",
], [
  "miss",
  "miss",
  "misses",
  "miss",
  "miss",
  "miss",
], "gen");

class Object {
  List<List> objList = [
    hestur,
    ljos,
    tolva,
    manneskja,
    hundur
  ];
  String caseCaused;
  int caseInt;

  Object(this.caseCaused) {
    if (caseCaused == "nom") {
      caseInt = 0;
    } else if (caseCaused == "acc") {
      caseInt = 1;
    } else if (caseCaused == "dat") {
      caseInt = 2;
    } else if (caseCaused == "gen") {
      caseInt = 3;
    }
  }

  int getRandomListItem(list) {
    Random random = new Random();
    int subjRandomNumber = random.nextInt(list.length);
    return subjRandomNumber;
  }

  int getObjectNum() {
    int objNum = getRandomListItem(objList);
    return objNum;
  }

  int getObjectForm(int obj) {
    int objForm = getRandomListItem(objList[obj][0]);
    return objForm;
  }
}

List<List> hestur = [
  [
    ["hestur", "hest", "hesti", "hests"],
    ["hestar", "hesta", "hestum", "hesta"],
    ["hesturinn", "hestinn", "hestinum", "hestsins"],
    ["hestarnir", "hestana", "hestunum", "hestanna"],
  ],
  [
    ["a horse", "a horse", "a horse", "a horse"],
    ["horses", "horses", "horses", "horses"],
    ["the horse", "the horse", "the horse", "the horse"],
    ["the horses", "the horses", "the horses", "the horses"],
  ],
];
List<List> ljos = [
  [
    ["ljós", "ljós", "ljósi", "ljóss"],
    ["ljós", "ljós", "ljósum", "ljósa"],
    ["ljósið", "ljósið", "ljósinu", "ljóssins"],
    ["ljósin", "ljósin", "ljósunum", "ljósanna"],
  ],
  [
    ["a light", "a light", "a light", "a light"],
    ["lights", "lights", "lights", "lights"],
    ["the light", "the light", "the light", "the light"],
    ["the lights", "the lights", "the lights", "the lights"],
  ],
];
List<List> tolva = [
  [
    ["tölva", "tölvu", "tölvu", "tölvu"],
    ["tölvur", "tölvur", "tölvum", "tölva"],
    ["tölvan", "tölvuna", "tölvunni", "tölvunnar"],
    ["tölvurnar", "tölvurnar", "tölvunum", "tölvanna"],
  ],
  [
    ["a computer", "a computer", "a computer", "a computer"],
    ["computers", "computers", "computers", "computers"],
    ["the computer", "the computer", "the computer", "the computer"],
    ["the computers", "the computers", "the computers", "the computers"],
  ],
];
List<List> manneskja = [
  [
    ["manneskja", "manneskju","manneskju", "manneskju"],
    ["manneskjur", "manneskjur", "manneskjum", "manneskja"],
    ["manneskjan", "manneskjuna", "manneskjunni", "manneskjunnar"],
    ["manneskjurnar", "manneskjurnar", "manneskjunum", "manneskjanna"],
  ],
  [
    ["a person", "a person", "a person", "a person"],
    ["people", "people", "people", "people"],
    ["the person", "the person", "the person", "the person"],
    ["the people", "the people", "the people", "the people"],
  ],
];
List<List> hundur = [
  [
    ["hundur", "hund","hundi", "hunds"],
    ["hundar", "hunda", "hundum", "hunda"],
    ["hundurinn", "hundinn", "hundinum", "hundsins"],
    ["hundarnir", "hundana", "hundunum", "hundanna"],
  ],
  [
    ["a dog", "a dog", "a dog", "a dog"],
    ["dogs", "dogs", "dogs", "dogs"],
    ["the dog", "the dog", "the dog", "the dog"],
    ["the dogs", "the dogs", "the dogs", "the dogs"],
  ],
];