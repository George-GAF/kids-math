import '../constant/enum_file.dart';

class Helper {
  static bool getComparisonResult(String name, List<int> numbers) {
    ComparisonType? comparisonType;
    for (var element in ComparisonType.values) {
      if (element.value == name) {
        comparisonType = element;
      }
    }
    if ((numbers[0] > numbers[1] &&
            ComparisonType.greaterThen == comparisonType) ||
        (numbers[0] < numbers[1] &&
            ComparisonType.lessThen == comparisonType) ||
        (numbers[0] == numbers[1] && ComparisonType.equal == comparisonType)) {
      return true;
    } else {
      return false;
    }
  }
  //-------------------------------------------------------------------
}
