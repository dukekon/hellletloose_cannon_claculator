import 'package:flutter/material.dart';

class ArrowButton extends StatefulWidget {
  const ArrowButton({required this.decoration, required this.onTap, super.key});
  final String decoration;
  final VoidCallback onTap;

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  late IconData _icon;
  double _size = 20;

  @override
  void initState() {
    super.initState();
    _icon = widget.decoration == 'left'
        ? Icons.arrow_back_ios_new
        : Icons.arrow_forward_ios;
  }

  void onTapDown(detail) {
    setState(() => _size = 16);
  }

  void onTapUp(detail) {
    widget.onTap();
    setState(() => _size = 20);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      child: AnimatedContainer(
        // color: Colors.white,
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.center,
        width: 30,
        height: 50,
        child: Icon(
          size: _size,
          _icon,
          color: Colors.white60,
        ),
      ),
    );
  }
}
