import 'package:flutter/material.dart';

class AppAnimatedButton extends StatefulWidget {
  // Atributos de la clase.
  final VoidCallback? onPressed;
  final Widget child;
  final Color startColor;
  final Color endColor;

  const AppAnimatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.startColor,
    required this.endColor,
  });

  @override
  State<AppAnimatedButton> createState() => _AppAnimatedButtonState();
}

class _AppAnimatedButtonState extends State<AppAnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _colorTween = ColorTween(begin: widget.startColor, end: widget.endColor).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) => FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          backgroundColor: _colorTween.value,
          disabledBackgroundColor: Colors.grey,
        ),
        onPressed: () {
          _animationController.status == AnimationStatus.completed
              ? _animationController.reverse()
              : _animationController.forward();
        },
        child: widget.child,
      ),
    );
  }
}
