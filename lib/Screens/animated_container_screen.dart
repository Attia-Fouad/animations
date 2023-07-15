import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

var crossFAde = CrossFadeState.showFirst;
var shapeFade = CrossFadeState.showFirst;
var xController = TextEditingController();
var yController = TextEditingController();

bool big = true;
bool isCircle = false;
double rotate = 0;
double size = 1;
bool bigText = false;
bool bigPadding = false;
bool visible = true;

double start = 0.0;
double end = 0.0;
double top = 0.0;
double bottom = 0.0;
double position = 100;

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  @override
  void initState() {
    super.initState();
    xController.text = '0';
    yController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
              ),
              ElasticIn(
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 50,
                  height: 100,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Transform.scale(
                scale: size,
                child: Transform.rotate(
                  origin: Offset(double.parse(xController.text),
                      double.parse(yController.text)),
                  angle: rotate.toDouble(),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: big ? 400 : 200,
                    height: big ? 400 : 200,
                    decoration: BoxDecoration(
                      color: big ? Colors.amber : Colors.purple,
                      borderRadius: BorderRadius.circular(isCircle ? 200 : 0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedCrossFade(
                          firstChild: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              crossFAde = CrossFadeState.showSecond;
                              changeContainerSize();
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(child: Text('Shrink')),
                            ),
                          ),
                          secondChild: MaterialButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              crossFAde = CrossFadeState.showFirst;
                              changeContainerSize();
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(child: Text('Expand')),
                            ),
                          ),
                          crossFadeState: crossFAde,
                          duration: const Duration(seconds: 1),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedCrossFade(
                          firstChild: InkWell(
                            borderRadius: BorderRadius.circular(200),
                            onTap: () {
                              shapeFade = CrossFadeState.showSecond;
                              changeContainerShape();
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200),
                              ),
                              child: const Center(child: Text('Circle')),
                            ),
                          ),
                          secondChild: MaterialButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              shapeFade = CrossFadeState.showFirst;
                              changeContainerShape();
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              height: 50,
                              width: 100,
                              color: Colors.white,
                              child: const Center(child: Text('Square')),
                            ),
                          ),
                          crossFadeState: shapeFade,
                          duration: const Duration(seconds: 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Slider(
                value: rotate,
                max: 2 * 3.14,
                min: 0,
                onChanged: (value) {
                  setState(() {
                    rotate = value;
                  });
                },
              ),
              Text('degree ' '${rotate}'),
              Slider(
                value: size,
                max: 13,
                min: 0,
                onChanged: (value) {
                  setState(() {
                    size = value;
                  });
                },
              ),
              Text('Size * ' '$size'),
              Text('write origin to rotate in pixels *'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('X  '),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      controller: xController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Y  '),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      controller: yController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: visible ? 1 : 0,
                child: AnimatedPadding(
                  duration: const Duration(seconds: 1),
                  padding: EdgeInsets.all(bigPadding ? 28 : 8),
                  child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: bigText ? Colors.deepOrange : Colors.black,
                        fontSize: bigText ? 28 : 16,
                        fontWeight: bigText ? FontWeight.bold : FontWeight.w400,
                      ),
                      duration: const Duration(seconds: 1),
                      child: const Text(
                        'Animated Text Style press button below to change this text style',
                        maxLines: null,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bigText = !bigText;
                    });
                  },
                  child: const Text("Animate the text")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bigPadding = !bigPadding;
                    });
                  },
                  child: const Text("Animate the text padding")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  child: const Text("change the text Opacity")),
              Stack(
                children: [
                  Container(
                    color: Colors.deepOrange,
                    height: 500,
                    width: double.infinity,
                  ),
                  AnimatedPositionedDirectional(
                      end: end,
                      bottom: bottom,
                      start: start,
                      top: top,
                      duration: const Duration(seconds: 1),
                      child: const Center(
                          child: Text('Animated Positioned Texet')))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      start = start + position;
                    });
                  },
                  child: const Text("increase start")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      end = end + 20;
                    });
                  },
                  child: const Text("increase end")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      top = top + 20;
                    });
                  },
                  child: const Text("increase top")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bottom = bottom + position;
                    });
                  },
                  child: const Text("increase bottom")),
            ],
          ),
        ),
      ),
    );
  }
}

void changeContainerSize() {
  big = !big;
}

void changeContainerShape() {
  isCircle = !isCircle;
}
