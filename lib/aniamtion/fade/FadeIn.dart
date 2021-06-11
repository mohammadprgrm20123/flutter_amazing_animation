
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';

import '../../techniques.dart';

class Fade extends StatefulWidget{

  AnimationParameters animationParameters;

 Fade({ required this.animationParameters});

 @override
  State<StatefulWidget> createState() {
    return FadeState();
  }
}


class FadeState extends State<Fade> with SingleTickerProviderStateMixin{
 late AnimationController _animationController;
 late Animation<double> fadeInAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: widget.animationParameters.duration);
    fadeInAnimation =new Tween<double>(begin:1.0,end:0.0).animate(_animationController);

  }
  @override
  Widget build(BuildContext context){
    if(widget.animationParameters.play){
      _animationController.forward();
      repeatAnimation();
    }

    print('build');
    return AnimatedBuilder(animation: _animationController, builder: (_,w){
      print(fadeInAnimation.value.toString());
      return Opacity(opacity: fadeInAnimation.value,child:widget.animationParameters.child ,);
    });
  }

  void repeatAnimation() async {
    for(int i=0;i<=widget.animationParameters.repeat;i++){
      await _animationController.forward();
      if(widget.animationParameters.reverse)
        await _animationController.reverse();
      else
        _animationController.reset();

      }

    }
  }