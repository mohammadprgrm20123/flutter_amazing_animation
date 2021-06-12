


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/animation_widget.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';


class FadeInDown extends AnimationWidget{

  AnimationParameters animationParameters;

  FadeInDown({required this.animationParameters});
  late AnimationController _animationController;
  late Animation<double> fadeInAnimation;
  late Animation<Offset> offsetAnimation;

  @override
  Widget animatedBuilder(BuildContext context, AnimationController animationController) {
    initAnimation(animationController);
    if(animationParameters.play){
      _animationController.forward();
      Utils.repeatAnimation(animationParameters.repeat, _animationController, animationParameters.reverse);
    }
    return AnimatedBuilder(animation: _animationController, builder: (_,w){
      print(fadeInAnimation.value.toString());
      return SlideTransition(
          position: offsetAnimation,
          child: Opacity(opacity: fadeInAnimation.value,child:animationParameters.child ,));
    });
  }

  @override
  void initAnimation(AnimationController animationController) {
    fadeInAnimation =new Tween<double>(begin:1.0,end:0.0).animate(animationController);
    offsetAnimation = new Tween<Offset>(begin: Offset.zero,end:  Offset(0.0,1.2),
    ).animate(animationController);  }
}
