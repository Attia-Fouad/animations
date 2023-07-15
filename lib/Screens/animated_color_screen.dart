import 'package:flutter/material.dart';

class AnimatedColorScreen extends StatefulWidget {
  const AnimatedColorScreen({super.key});

  @override
  State<AnimatedColorScreen> createState() => _AnimatedColorScreenState();
}

class _AnimatedColorScreenState extends State<AnimatedColorScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    //if you got an error add extension package in pubspec
    animation = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Color')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'this text color will be changed',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: animation.value),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    animationController.forward();
                  },
                  child: const Icon(Icons.arrow_forward_ios_rounded)),
              ElevatedButton(
                  onPressed: () {
                    animationController.reverse();
                  },
                  child: const Icon(Icons.arrow_back_ios_rounded)),
            ],
          ),
        ],
      ),
    );
  }
}
