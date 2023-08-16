import 'package:flutter/material.dart';

Color backgroundApp = Color(0xff270118);
Color IconApp = Color(0xff270118);
Color backgroundApp1 = Color(0xff900852);
Color backgroundApp2 = Color(0xf1571181);

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Colors.red, Colors.black],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class GradientIcon extends StatelessWidget {
  final Gradient gradient;
  final double iconSize;
  final Widget child;

  const GradientIcon({
    super.key,
    required this.gradient,
    required this.iconSize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: IconTheme(
        data: IconThemeData(size: iconSize),
        child: child,
      ),
    );
  }
}
