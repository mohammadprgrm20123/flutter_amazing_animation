
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';
import '../../animation_widget.dart';

class StretchAnimation extends AnimationWidget{

  AnimationParameters animationParameters;

  StretchAnimation({required this.animationParameters});
 late Animation<double> animationScale;



  @override
  Widget animatedBuilder(BuildContext context, AnimationController animationController) {
    initAnimation(animationController);
    if (animationParameters.play) {
      animationController.forward();
      Utils.repeatAnimation(animationParameters.repeat, animationController,
          animationParameters.reverse);
    }
    return AnimatedBuilder(animation: animationController, builder:(_,__){
      return Transform.scale(
        scale :animationScale.value,
      child: animationParameters.child,
      );

    });
  }

  @override
  void initAnimation(AnimationController animationController) {
    animationScale = Tween<double>(begin: 1.0,end:10.0).animate(animationController);
  }

}