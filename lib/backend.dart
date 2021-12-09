import 'dart:io';
import 'dart:math';
import 'library.dart';

int getRandomListItem(list) {
  Random random = new Random();
  int subjRandomNumber = random.nextInt(list.length);
  return subjRandomNumber;
}

void main() {
  Subject subject = new Subject();
  int subjNum = subject.getSubjectNum();
  int innerSubjNum = subject.getInnerSubjectNum(subjNum);
  String isSubject = subject.islSubjList[subjNum][innerSubjNum];
  String enSubject = subject.engSubjList[subjNum][innerSubjNum];
  int verbNum = getRandomListItem(verbs);
  String isVerb = verbs[verbNum].islVerbList[subjNum];
  String enVerb = verbs[verbNum].engVerbList[subjNum];
  String verbCase = verbs[verbNum].caseCaused;
  Object object = new Object(verbCase);
  int objectNum = object.getObjectNum();
  int objectForm = object.getObjectForm(objectNum);
  String isObject = object.objList[objectNum][0][objectForm][object.caseInt];
  String enObject = object.objList[objectNum][1][objectForm][object.caseInt];
  print("$isSubject $isVerb $isObject");
  print("$enSubject $enVerb $enObject");

}
