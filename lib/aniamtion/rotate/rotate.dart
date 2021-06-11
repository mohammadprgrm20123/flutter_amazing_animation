




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/techniques.dart';


class Rotate extends StatefulWidget{

  AnimationParameters animationParameters;
  Rotate({required this.animationParameters});

  @override
  State<StatefulWidget> createState() {
    return RotateState();
  }
}


class RotateState extends State<Rotate> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> rotateAnimation;
  late Animation<int> fadeInAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: widget.animationParameters.duration);
    rotateAnimation =new Tween<double>(begin:0.0,end:1.0).animate(_animationController);

  }
  @override
  Widget build(BuildContext context){
    if(widget.animationParameters.play){
      _animationController.forward();
      repeatAnimation();
    }
    return AnimatedBuilder(animation: _animationController, builder: (_,w){
      print(rotateAnimation.value.toString());
      return RotationTransition(
          turns: rotateAnimation,
          child: Opacity(opacity: rotateAnimation.value,child: widget.animationParameters.child));
  });
  }

  void repeatAnimation() async {
    for(int i=0;i<widget.animationParameters.repeat;i++){
      await _animationController.forward();
      if(widget.animationParameters.reverse)
        await _animationController.reverse();
      else
        _animationController.reset();
    }
  }
}