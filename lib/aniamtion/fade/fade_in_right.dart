


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';


class FadeInRight extends StatefulWidget{

  AnimationParameters animationParameters;

  FadeInRight({ required this.animationParameters});

  @override
  State<StatefulWidget> createState() {
    return FadeInRightState();
  }
}


class FadeInRightState extends State<FadeInRight> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> fadeInAnimation;
  late Animation<Offset> offsetAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: (widget.animationParameters.duration));
    fadeInAnimation =new Tween<double>(begin:1.0,end:0.0).animate(_animationController);
    offsetAnimation = new Tween<Offset>(begin: Offset.zero,end:  Offset(0.5,0.0),
    ).animate(_animationController);

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
      return SlideTransition(
          position: offsetAnimation,
          child: Opacity(opacity: fadeInAnimation.value,child:widget.animationParameters.child ,));
    });
  }

  void repeatAnimation() async {
    for(int i=0;i<=widget.animationParameters.repeat;i++){
      await _animationController.forward();
       _animationController.reset();

    }

  }
}