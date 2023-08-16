import 'package:flutter/material.dart';

class LoveView extends StatefulWidget {
  const LoveView({super.key});

  @override
  State<LoveView> createState() => _LoveViewState();
}

class _LoveViewState extends State<LoveView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Love view"),
    );
  }
}
