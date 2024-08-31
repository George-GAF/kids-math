import 'dart:math';

class GetNumbers {
  GetNumbers._();
  static final GetNumbers _instance = GetNumbers._();
  factory GetNumbers() {
    return _instance;
  }

  int _getRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min);
  }

  List<int> getNumbers(int min, int max) {
    List<int> numbers = [];
    int one = _getRandomNumber(min, max);
    int two = _getRandomNumber(min, max);
    numbers.add(one);
    numbers.add(two);
    //numbers.add(one > two ? one : two);
    //numbers.add(two < one ? two : one);
    return numbers;
  }
}
