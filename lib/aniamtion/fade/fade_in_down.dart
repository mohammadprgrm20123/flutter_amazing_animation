
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/utils/utils.dart';


class FadeInDown extends StatefulWidget {


  final Widget child;
  final int repeat;
  final bool play;
  final Duration duration;
  final bool reverse;
  FadeInDown({required this.repeat,required this.child, required this.play, required this.duration, required this.reverse});


  @override
  State<StatefulWidget> createState() {
    return FadeInDownState();
  }
}

class FadeInDownState extends State<FadeInDown> with SingleTickerProviderStateMixin{


  late Animation<double> fadeInAnimation;
  late Animation<Offset> offsetAnimation;
  late AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this,duration:widget.duration);
    fadeInAnimation = new Tween<double>(begin: 1.0, end: 0.0).animate(animationController);
    offsetAnimation = new Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.2),).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      animationController.forward();
      Utils.repeatAnimation(widget.repeat, animationController, widget.reverse);
    }
    return AnimatedBuilder(animation: animationController, builder: (_, w) {
      return SlideTransition(
          position: offsetAnimation,
          child: Opacity(opacity: fadeInAnimation.value,
            child: widget.child,));
    });
  }
}


