import 'package:flutter/material.dart';
import 'package:hll_cannon_calc/widgets/arrow_button.dart';

import '../data/factions.dart';

class FactionSwitcher extends StatefulWidget {
  const FactionSwitcher({required this.onChange, super.key});
  final Function(String faction) onChange;

  @override
  State<FactionSwitcher> createState() => _FactionSwitcherState();
}

class _FactionSwitcherState extends State<FactionSwitcher> {
  int _index = 0;
  double _base = -1;
  void onTapLeft() {
    setState(() {
      _base = 1;
      if (_index > 0) {
        _index--;
      } else {
        _index = 2;
      }
    });
    widget.onChange(factions[_index]['name'] as String);
  }

  void onTapRight() {
    _base = -1;
    setState(() {
      if (_index < 2) {
        _index++;
      } else {
        _index = 0;
      }
    });
    widget.onChange(factions[_index]['name'] as String);
  }

  @override
  Widget build(BuildContext context) {
    // divider
    Widget divider = const Divider(
      height: 0,
      color: Colors.white60,
    );

    // render
    return Column(children: [
      AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            // Fade Transition with Horizontal Movement
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(_base * 0.5, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Image.asset(
            factions[_index]['icon'] as String,
            key: ValueKey(_index),
            height: 96,
          )),
      const SizedBox(height: 24),
      // title
      Row(
        children: [
          Expanded(
            child: divider,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('阵营选择',
                  style: TextStyle(fontSize: 14, color: Colors.white60))),
          Expanded(
            child: divider,
          ),
        ],
      ),
      Row(children: [
        ArrowButton(decoration: 'left', onTap: onTapLeft),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              // Fade Transition with Horizontal Movement
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(_base * 0.5, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: Text(
              factions[_index]['name'] as String,
              key: ValueKey(_index),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, color: Colors.white70),
            ),
          ),
        ),
        ArrowButton(decoration: 'right', onTap: onTapRight),
      ]),
      const SizedBox(height: 4),
      divider,
    ]);
  }
}
