import 'package:flutter/material.dart';

class SizeTransitionScreen extends StatefulWidget {
  const SizeTransitionScreen({super.key});

  @override
  State<SizeTransitionScreen> createState() => _SizeTransitionScreenState();
}

class _SizeTransitionScreenState extends State<SizeTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));

    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.slowMiddle));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _startAnimation() {
    if (_controller.isCompleted) {
      _controller.reset();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Size Transition Example"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: _startAnimation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: SizeTransition(
                    sizeFactor: _animation,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.yellow,
                      child: Image.asset("assets/images/dog.png"),
                    )),
              ),
            ),
          ),
        ));
  }
}
