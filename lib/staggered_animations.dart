import 'package:flutter/material.dart';

class StaggeredAnimations extends StatefulWidget {
  const StaggeredAnimations({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimations> createState() => _StaggeredAnimationsState();
}

class _StaggeredAnimationsState extends State<StaggeredAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  late Animation _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleAnimation = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.linear));
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14159265).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.5, 1.0)));

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
      child: Transform.rotate(
          angle: _rotateAnimation.value,
          child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                  color: Colors.deepOrange, width: 100, height: 100))),
    );
  }
}
