import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_module_animation/animation_widget.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';

class RotateY extends AnimationWidget {
  late Animation<double> rotateAnim;

  AnimationParameters animationParameters;

  RotateY({required this.animationParameters});

  @override
  Widget animatedBuilder(
      BuildContext context, AnimationController animationController) {
    initAnimation(animationController);
    if (animationParameters.play) {
      animationController.forward();
      Utils.repeatAnimation(animationParameters.repeat, animationController,
          animationParameters.reverse);
    }
    return AnimatedBuilder(
        animation: animationController,
        child: animationParameters.child,
        builder: (_, w) {
          print(rotateAnim.value.toString());
          return Transform(
              transform: Matrix4.identity()..rotateY(rotateAnim.value),
              alignment: Alignment.center,
              child: animationParameters.child
          );
        });
  }

  @override
  void initAnimation(AnimationController animationController) {
    rotateAnim = Tween(begin: pi, end: 0.0).animate(animationController);
  }
}
