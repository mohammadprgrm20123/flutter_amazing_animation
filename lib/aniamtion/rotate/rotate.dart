
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/animation_widget.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';


class Rotate extends AnimationWidget{

  AnimationParameters animationParameters;
  late Animation<double> rotateAnimation;
  late Animation<int> fadeInAnimation;

  Rotate({required this.animationParameters});



  @override
  Widget animatedBuilder(BuildContext context, AnimationController animationController) {

    initAnimation(animationController);

    if(animationParameters.play) {
      animationController.forward();
      Utils.repeatAnimation(animationParameters.repeat, animationController, animationParameters.reverse);
    }
    return AnimatedBuilder(animation: animationController, builder: (_,w){
      print(rotateAnimation.value.toString());
      return RotationTransition(
          turns: rotateAnimation,
          child: Opacity(opacity: rotateAnimation.value,child: animationParameters.child));
    });  }

  @override
  void initAnimation(AnimationController animationController) {
    rotateAnimation =new Tween<double>(begin:0.0,end:1.0).animate(animationController);
  }
}
