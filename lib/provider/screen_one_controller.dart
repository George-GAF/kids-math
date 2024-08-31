
import 'package:flutter/material.dart';

import '../constant/enum_file.dart';
import '../helper/answer_detail.dart';
import '../helper/generate_question_with_answer.dart';

class ScreenOneController extends ChangeNotifier {

  OperationType _activeOperation = OperationType.add;
  List<int> _question = [];
  List<int> _answers = [];
  List<AnswerDetail> _answersHistory = [];
  GenerateQuestionWithAnswer _questionWithAnswer = GenerateQuestionWithAnswer();

  OperationType get activeOperation => _activeOperation;
  List<int> get question => _question;
  List<int> get answers => _answers;
  List<AnswerDetail> get answerHistory => _answersHistory;
  GenerateQuestionWithAnswer get questionWithAnswer => _questionWithAnswer;


  void resetValue() {
   /* _isRight = false;
    _isWrong = false;
    _isAnimDone= true;*/
    _activeOperation = OperationType.add;
    _question = [];
    _answers = [];
    _answersHistory = [];
    _questionWithAnswer = GenerateQuestionWithAnswer();
   // notifyListeners();
  }

  void saveData(List<int> question, List<int> answerList) {
    _question = question;
    _answers = answerList;
  }

  void updateActiveOperation(OperationType operation) {
    _activeOperation = operation;
    notifyListeners();
  }

  void updateAnswerHis(List<AnswerDetail> answers) {
    _answersHistory = answers;
    notifyListeners();
  }

  void addAnswerToHistory(AnswerDetail answer) {
    _answersHistory.add(answer);
    notifyListeners();
  }

  void updateQuestion(List<int> question) {
    _question = question;
  }

  void updateAnswers(List<int> answers) {
    _answers = answers;
  }
/*
  void updateIsRight(bool isRight) {
    _isRight = isRight;
    notifyListeners();
  }

  void updateIsWrong(bool isWrong) {
    _isWrong = isWrong;
    notifyListeners();
  }

 */
}
