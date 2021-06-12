


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';

import '../../animation_widget.dart';


class FadeInRight extends AnimationWidget{

  AnimationParameters animationParameters;
  late Animation<double> fadeInAnimation;
  late Animation<Offset> offsetAnimation;
  FadeInRight({ required this.animationParameters});


  @override
  Widget animatedBuilder(BuildContext context, AnimationController animationController) {
    initAnimation(animationController);
    if(animationParameters.play){
      animationController.forward();
      Utils.repeatAnimation(animationParameters.repeat, animationController,animationParameters.reverse);
    }
    return AnimatedBuilder(animation: animationController, builder: (_,w){
      return SlideTransition(
          position: offsetAnimation,
          child: Opacity(opacity: fadeInAnimation.value,child:animationParameters.child ,));
    });
  }

  @override
  void initAnimation(AnimationController animationController) {
    fadeInAnimation =new Tween<double>(begin:1.0,end:0.0).animate(animationController);
    offsetAnimation = new Tween<Offset>(begin: Offset.zero,end:  Offset(0.5,0.0),
    ).animate(animationController);

  }
}
