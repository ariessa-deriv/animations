import 'package:animations/multiple_animations.dart';
import 'package:animations/simple_scale_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultipleAnimations(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultipleAnimations();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: EdgeInsetsTween(
          begin: const EdgeInsets.all(20.0),
          end: const EdgeInsets.all(100.0),
        ),
        builder: (BuildContext? context, EdgeInsets? value, Widget? child) {
          return Container(
            color: Colors.blue.shade300,
            padding: value!,
            child: child!,
          );
        },
        child:
            Container(color: Colors.blue.shade200, width: 100.0, height: 100.0),
        duration: Duration(seconds: 4),
      ),
    );
  }
}
