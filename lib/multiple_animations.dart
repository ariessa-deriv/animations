import 'package:flutter/material.dart';

class MultipleAnimations extends StatefulWidget {
  const MultipleAnimations({Key? key}) : super(key: key);

  @override
  State<MultipleAnimations> createState() => _MultipleAnimationsState();
}

class _MultipleAnimationsState extends State<MultipleAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  late Animation _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _scaleAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14159265)
        .animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: _rotateAnimation.value,
        child: Transform.scale(
            scale: _scaleAnimation.value,
            child:
                Container(color: Colors.deepOrange, width: 100, height: 100)));
  }
}
