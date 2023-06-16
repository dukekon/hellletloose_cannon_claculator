import 'package:flutter/material.dart';

import '../data/mils.dart';

class Claculator extends StatefulWidget {
  const Claculator({required this.faction, Key? key}) : super(key: key);
  final String faction;

  @override
  State<Claculator> createState() => _ClaculatorState();
}

class _ClaculatorState extends State<Claculator> {
  int _result = 0;
  void _calculate(int value) {
    int key = value ~/ 100 * 100;
    setState(() {
      _result =
          mils[widget.faction]![key]! - (value % 100 / 4.16666667).round();
    });
  }

  void _onChange(String content) {
    if (content.isEmpty) return;
    int value = int.parse(content);
    if (value < 100 || value > 1600) {
      setState(() => _result = 0);
      return;
    }
    _calculate(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        onChanged: _onChange,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        decoration: InputDecoration(
          hintText: '输入目标距离(米)',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[900],
        ),
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 36),
      AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Text(
            _result == 0 ? '' : '$_result MIL',
            style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Colors.white30),
          )),
    ]);
  }
}
