import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatefulWidget {
  const AnimatedPhysicalModelScreen({super.key});

  @override
  State<AnimatedPhysicalModelScreen> createState() =>
      _AnimatedPhysicalModelScreenState();
}

class _AnimatedPhysicalModelScreenState
    extends State<AnimatedPhysicalModelScreen> {
  bool hasShadow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated physical model screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              hasShadow = !hasShadow;
            });
          },
          child: AnimatedPhysicalModel(
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            elevation: hasShadow ? 10 : 0,
            color: Colors.grey,
            shadowColor: Colors.blueGrey,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/tom.png'),
            ),
          ),
        ),
      ),
    );
  }
}
