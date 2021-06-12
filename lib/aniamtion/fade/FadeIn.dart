
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/animation_widget.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';

import '../../techniques.dart';

class FadeIn extends AnimationWidget{

  AnimationParameters animationParameters;
  late Animation<double> fadeInAnimation;

 FadeIn({ required this.animationParameters});


  @override
  Widget animatedBuilder(BuildContext context, AnimationController animationController) {

    initAnimation(animationController);

    if(animationParameters.play){
      animationController.forward();
      Utils.repeatAnimation(animationParameters.repeat, animationController, animationParameters.reverse);
    }

    print('build');
    return AnimatedBuilder(animation: animationController, builder: (_,w){
      print(fadeInAnimation.value.toString());
      return Opacity(opacity: fadeInAnimation.value,child:animationParameters.child ,);
    });
  }

  @override
  void initAnimation(AnimationController animationController) {
    fadeInAnimation =new Tween<double>(begin:1.0,end:0.0).animate(animationController);
  }
}