import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:blackrose/utils/global.colors.dart';

class AppBarView {
  static AppBar appBarView = AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.black38,
    ),
    title: ShaderMask(
      shaderCallback: (bounds) {
        return AppGradients.primaryGradient.createShader(bounds);
      },
      child: const Text("BlackRose"),
    ),
    actions: [
      Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
      ),
    ],
  );
}
