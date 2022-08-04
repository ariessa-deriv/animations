import 'package:flutter/material.dart';

class SimpleScaleAnimation extends StatefulWidget {
  const SimpleScaleAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleScaleAnimation> createState() => _SimpleScaleAnimationState();
}

class _SimpleScaleAnimationState extends State<SimpleScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);

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
    return Center(
      child: Transform.scale(
        scale: _animation.value,
        child: Container(color: Colors.deepOrange, width: 50.0, height: 50.0),
      ),
    );
  }
}
