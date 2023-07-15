import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.animatedListScreen);
                  },
                  child: const Text('Go to animated list screen')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .push(AppRouter.animatedContainerScreen);
                  },
                  child: const Text('Go to animated container screen')),
            ],
          ),
        ),
      ),
    );
  }
}