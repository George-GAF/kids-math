import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/board_provider.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    super.key,
    required this.number,
    required this.size,
    required this.answerIndex,
    required this.updateAnswerState,
    required this.onTap,
    required this.index,
  });
  final int index;
  final int number;
  final double size;
  final int answerIndex;
  final Function() onTap;
  final Function(int, bool) updateAnswerState;
  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isCorrect = false;
  int answerNumber = 0;

  @override
  Widget build(BuildContext context) {
    var boardProvider = context.watch<BoardProvider>();
    if (widget.index == boardProvider.indexTapped) {
      int temp = boardProvider.numberTyped;
      _textEditingController.text = '${temp == -1 ? "" : temp}';
      if (temp != -1) {
        isCorrect = temp == widget.number;
        widget.updateAnswerState(widget.answerIndex, isCorrect);
      }
    }

    if (boardProvider.clear) {
      _textEditingController.text = '';
      isCorrect = false;
    }

    return TextField(
      keyboardAppearance: Brightness.dark,
      controller: _textEditingController,
      keyboardType: TextInputType.none,
      maxLength: 2,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.top,
      onTap: () {
        widget.onTap();
      },
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: widget.size / 3,
      ),
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: isCorrect ? Colors.green : Colors.red,
        border: const OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
