import 'package:flutter/material.dart';
import 'package:hll_cannon_calc/widgets/claculator.dart';
import 'package:hll_cannon_calc/widgets/faction_switcher.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  String _currentFaction = '美德';

  void _onFactionChange(String faction) {
    setState(() => _currentFaction = faction);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HLL Cannon Calculator',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            color: Colors.black,
            child: Column(children: [
              FactionSwitcher(
                onChange: _onFactionChange,
              ),
              const SizedBox(height: 36),
              Claculator(
                faction: _currentFaction,
                key: ValueKey(_currentFaction),
              ),
            ]),
          ),
        ));
  }
}
