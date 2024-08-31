import 'dart:math';

import '../constant/enum_file.dart';
import 'create_numbers.dart';

class GenerateQuestionWithAnswer {
  late OperationType operation;
  late int min;
  late int max;
  GenerateQuestionWithAnswer();
  List<int> questionContent = [];
  List<int> answersList = [];

  void fillValue(OperationType operation, int min, int max) {
    this.operation = operation;
    this.min = min;
    this.max = max;
    questionContent = _question(min, max, operation);
    answersList = _generateAnswerForAddAndMinus(
        questionContent[0], questionContent[1], operation);
  }

  void newQuestion() {
    questionContent = _question(min, max, operation);
    answersList = _generateAnswerForAddAndMinus(
        questionContent[0], questionContent[1], operation);
  }

  void updateAnswers(OperationType newOperation) {
    operation = newOperation;
    answersList = _generateAnswerForAddAndMinus(
        questionContent[0], questionContent[1], operation);

   }

  List<int> _question(int min, int max, OperationType operationType) {
    List<int> nums = GetNumbers().getNumbers(min, max);
    nums.sort((a, b) => b.compareTo(a));
    return nums;
  }

  List<int> _generateAnswerForAddAndMinus(
      int num1, int num2, OperationType operationType) {
    List<int> sign = [-1, 1];
    List<int> answers = [];
    int correctAnswer =
        operationType == OperationType.add ? num1 + num2 : num1 - num2;
    int correctAnswerIndex = Random().nextInt(6);

    for (int i = 0; i < 6; i++) {
      if (i == correctAnswerIndex) {
        answers.add(correctAnswer);
      } else {
        int randomSign = sign[Random().nextInt(2)];
        int wrongAnswer = correctAnswer + randomSign * (i + 1);
        // Ensure the wrong answer is not equal to the correct answer
        while (answers.contains(wrongAnswer) || wrongAnswer == correctAnswer) {
          randomSign = sign[Random().nextInt(2)];
          wrongAnswer = correctAnswer + randomSign * (i + 1);
        }
        answers.add(wrongAnswer);
      }
    }
    return answers;
  }
}
