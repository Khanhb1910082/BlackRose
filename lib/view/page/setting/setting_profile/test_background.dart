import 'dart:math';

import 'package:flutter/material.dart';

class MovingDotsAnimation extends StatefulWidget {
  const MovingDotsAnimation({super.key});

  @override
  State<MovingDotsAnimation> createState() => _MovingDotsAnimationState();
}

class _MovingDotsAnimationState extends State<MovingDotsAnimation>
    with SingleTickerProviderStateMixin {
  double top = 0.0;
  double left = 0.0;
  Color color = Colors.white;

  late AnimationController _controller;
  Animation<Color?>? _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {
        top = Random().nextDouble() * MediaQuery.of(context).size.height;
        left = Random().nextDouble() * MediaQuery.of(context).size.width;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _colorAnimation!,
        builder: (context, child) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(top: top, left: left),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: _colorAnimation!.value,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
