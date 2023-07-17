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
        child: ListView(
          physics: const BouncingScrollPhysics(),
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
                  GoRouter.of(context).push(AppRouter.animatedContainerScreen);
                },
                child: const Text('Go to animated container screen')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.animatedColorScreen);
                },
                child: const Text('Go to animated Color screen')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.animatedAlignScreen);
                },
                child: const Text('Go to animated align screen')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context)
                      .push(AppRouter.animatedPhysicalModelScreen);
                },
                child: const Text('Go to animated physicalModel screen')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  // Customize other button properties if needed
                ),
                onPressed: () {
                  GoRouter.of(context)
                      .push(AppRouter.positionedTransitionScreen);
                },
                child: const Text('Go to positioned transition screen')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  // Customize other button properties if needed
                ),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.sizeTransitionScreen);
                },
                child: const Text('Go to size transition screen')),
          ],
        ),
      ),
    );
  }
}
