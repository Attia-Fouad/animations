import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});
  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

List<String> names = [
  'Attia',
  'Fouad',
  'Atta',
  'Habashy',
];
final ScrollController scrollContainer = ScrollController();
GlobalKey<AnimatedListState> listKey = GlobalKey();

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: AnimatedList(
                controller: scrollContainer,
                key: listKey,
                initialItemCount: names.length,
                itemBuilder: (context, index, animation) => BuildItem(
                  animation: animation,
                  context: context,
                  index: index,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addItem();
                },
                child: const Text('Add item')),
          ],
        ),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  final animation;
  final context;
  final index;

  const BuildItem({super.key, this.animation, this.context, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: SizeTransition(
          sizeFactor: animation,
          child: Row(
            children: [
              Text(names[index]),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    removeItem(index);
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ));
  }
}

void removeItem(int index) {
  var removedItem = names.removeAt(index);

  listKey.currentState?.removeItem(
      index,
      (context, animation) => SlideTransition(
            position: animation.drive(Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            )),
            child: Text(removedItem),
          ));
}

Future<void> addItem() async {
  var index = names.length;
  names.add('${index + 1}');
  listKey.currentState?.insertItem(index);
  await Future.delayed(const Duration(milliseconds: 500));
  scrollContainer.animateTo(scrollContainer.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
}
