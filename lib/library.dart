//0 = 1p sing, 1 = 2p sing, 2 = 3p sing, 3 = 1p plur, 4 = 2p plur, 5 = 3p plur
import 'dart:math';

//Sentence subjects (first word):
List<String> sing1pis = ["Ég"];
List<String> sing2pis = ["Þú"];
List<String> sing3pis = ["Hann", "Hún", "Það"];
List<String> plur1pis = ["Við"];
List<String> plur2pis = ["Þið"];
List<String> plur3pis = ["Þeir", "Þær", "Þau"];
List<String> sing1pen = ["I"];
List<String> sing2pen = ["You (s.)"];
List<String> sing3pen = ["He", "She", "It"];
List<String> plur1pen = ["We"];
List<String> plur2pen = ["You (pl.)"];
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
    Random random = Random();
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
  leitaad,
  elska,
  hata,
  sja,
  eiga,
  borda,
  maneftir,
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
  //records what case this verb causes (accusative (þolfall), dative (þágufall) or genitive (eignarfall)):
  String caseCaused;

  Verb(this.islVerbList, this.engVerbList, this.caseCaused);
}

Verb leitaad = Verb([
  "leita að",
  "leitar að",
  "leitar að",
  "leitum að",
  "leitið að",
  "leita að",
], [
  "look for",
  "look for",
  "looks for",
  "look for",
  "look for",
  "look for",
], "dat");
Verb elska = Verb([
  "elska",
  "elskar",
  "elskar",
  "elskum",
  "elskið",
  "elska",
], [
  "love",
  "love",
  "loves",
  "love",
  "love",
  "love",
], "acc");
Verb hata = Verb([
  "hata",
  "hatar",
  "hatar",
  "hötum",
  "hatið",
  "hata",
], [
  "hate",
  "hate",
  "hates",
  "hate",
  "hate",
  "hate",
], "acc");
Verb sja = Verb([
  "sé",
  "sérð",
  "sér",
  "sjáum",
  "sjáið",
  "sjá",
], [
  "see",
  "see",
  "sees",
  "see",
  "see",
  "see",
], "acc");
Verb eiga = Verb([
  "á",
  "átt",
  "á",
  "eigum",
  "eigið",
  "eiga",
], [
  "own",
  "own",
  "owns",
  "own",
  "own",
  "own",
], "acc");
Verb borda = Verb([
  "borða",
  "borðar",
  "borðar",
  "borðum",
  "borðið",
  "borða",
], [
  "eat",
  "eat",
  "eats",
  "eat",
  "eat",
  "eat",
], "acc");
Verb maneftir = Verb([
  "man eftir",
  "manst eftir",
  "man eftir",
  "munum eftir",
  "munið eftir",
  "muna eftir",
], [
  "remember",
  "remember",
  "remembers",
  "remember",
  "remember",
  "remember",
], "dat");
Verb hjalpa = Verb([
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
Verb horfaa = Verb([
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
Verb talavid = Verb([
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
Verb hitta = Verb([
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
Verb henda = Verb([
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
Verb sakna = Verb([
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
    hus,
    epli,
    mynd,
    bill,
    bord,
    bolti,
    hestur,
    ljos,
    tolva,
    manneskja,
    hundur
  ];
  String caseCaused;
  int caseInt = 0;

  //used "casecaused" from the verb to pick correct case for object (word 3):
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
    Random random = Random();
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

List<List> hus = [
  [
    ["hús", "hús", "húsi", "húss"],
    ["hús", "hús", "húsum", "húsa"],
    ["húsið", "húsið", "húsinu", "hússins"],
    ["húsin", "húsin", "húsunum", "húsanna"],
  ],
  [
    ["a house", "a house", "a house", "a house"],
    ["houses", "houses", "houses", "houses"],
    ["the house", "the house", "the house", "the house"],
    ["the houses", "the houses", "the houses", "the houses"],
  ],
];
List<List> epli = [
  [
    ["epli", "epli", "epli", "eplis"],
    ["epli", "epli", "eplum", "epla"],
    ["eplið", "eplið", "eplinu", "eplisins"],
    ["eplin", "eplin", "eplunum", "eplanna"],
  ],
  [
    ["an apple", "an apple", "an apple", "an apple"],
    ["apples", "apples", "apples", "apples"],
    ["the apple", "the apple", "the apple", "the apple"],
    ["the apples", "the apples", "the apples", "the apples"],
  ],
];
List<List> mynd = [
  [
    ["mynd", "mynd", "mynd", "myndar"],
    ["myndir", "myndir", "myndum", "mynda"],
    ["myndin", "myndina", "myndinni", "myndarinnar"],
    ["myndirnar", "myndirnar", "myndunum", "myndanna"],
  ],
  [
    ["a picture", "a picture", "a picture", "a picture"],
    ["pictures", "pictures", "pictures", "pictures"],
    ["the picture", "the picture", "the picture", "the picture"],
    ["the pictures", "the pictures", "the pictures", "the pictures"],
  ],
];
List<List> bill = [
  [
    ["bíll", "bíl", "bíl", "bíls"],
    ["bílar", "bíla", "bílum", "bíla"],
    ["bíllinn", "bílinn", "bílnum", "bílsins"],
    ["bílarnir", "bílana", "bílunum", "bílanna"],
  ],
  [
    ["a car", "a car", "a car", "a car"],
    ["cars", "cars", "cars", "cars"],
    ["the car", "the car", "the car", "the car"],
    ["the cars", "the cars", "the cars", "the cars"],
  ],
];
List<List> bord = [
  [
    ["borð", "borð", "borði", "borðs"],
    ["borð", "borð", "borðum", "borða"],
    ["borðið", "borðið", "borðinu", "borðsins"],
    ["borðin", "borðin", "borðunum", "borðanna"],
  ],
  [
    ["a table", "a table", "a table", "a table"],
    ["tables", "tables", "tables", "tables"],
    ["the table", "the table", "the table", "the table"],
    ["the tables", "the tables", "the tables", "the tables"],
  ],
];
List<List> bolti = [
  [
    ["bolti", "bolta", "bolta", "bolta"],
    ["boltar", "bolta", "boltum", "bolta"],
    ["boltinn", "boltann", "boltanum", "boltans"],
    ["boltarnir", "boltana", "boltunum", "boltanna"],
  ],
  [
    ["a ball", "a ball", "a ball", "a ball"],
    ["balls", "balls", "balls", "balls"],
    ["the ball", "the ball", "the ball", "the ball"],
    ["the balls", "the balls", "the balls", "the balls"],
  ],
];
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