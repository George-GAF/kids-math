class AnswerDetail {
  late int firstNum;
  late int secondNum;
  late String operation;
  late int answer;
  late bool isRight;

  final List<String> _spaces = [];
  List<String> get spaces => _spaces;

  void space() {
    var list = [
      firstNum.toString().length,
      secondNum.toString().length,
      answer.toString().length
    ];
    list.sort();
    var longest = list.last + 1;
    var fSpace =
        List<String>.filled(longest - firstNum.toString().length, ' ').join();
    var sSpace =
        List<String>.filled(longest - secondNum.toString().length, ' ').join();
    var tSpace =
        List<String>.filled(longest - answer.toString().length, ' ').join();
    _spaces.add(fSpace);
    _spaces.add(sSpace);
    _spaces.add(tSpace);
  }
}
