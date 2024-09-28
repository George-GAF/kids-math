
enum OperationType { add, minus, multiply, divide }

extension OperationTypeValue on OperationType {
  String get value {
    switch (this) {
      case OperationType.add:
        return '+';
      case OperationType.minus:
        return '-';
      case OperationType.multiply:
        return '*';
      case OperationType.divide:
        return '/';
    }
  }
}

enum ComparisonType { greaterThen, equal, lessThen }

extension ComparisonTypeValue on ComparisonType {
  String get value {
    switch (this) {
      case ComparisonType.greaterThen:
        return '>';
      case ComparisonType.equal:
        return '=';
      case ComparisonType.lessThen:
        return '<';
    }
  }
}

enum RotateDir { left, none, right }

extension RotateDirValue on RotateDir {
  double get value {
    switch (this) {
      case RotateDir.left:
        return -.1;
      case RotateDir.none:
        return 0;
      case RotateDir.right:
        return .1;
    }
  }
}

enum ShapesName { rectangle, circle, square, hash, plus, diamond }

enum Setting{sound,music}

extension SettingValue on Setting{
  String get value {
    switch (this){
      case Setting.sound:
        return 'Sound';
      case Setting.music:
        return 'Music';
    }
  }
}