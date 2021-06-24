
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';
import '../../animation_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';

import '../../animation_widget.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/utils/utils.dart';


class Zoom extends StatefulWidget {


  final Widget child;
  final int repeat;
  final bool play;
  final Duration duration;
  final bool reverse;
  Zoom({required this.repeat,required this.child, required this.play, required this.duration, required this.reverse});


  @override
  State<StatefulWidget> createState() {
    return ZoomState();
  }
}

class ZoomState extends State<Zoom> with SingleTickerProviderStateMixin{


  late Animation<double> animationScale;
  late AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this,duration:widget.duration);
    animationScale = Tween<double>(begin: 1.0,end:1.3).animate(animationController);

  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      animationController.forward();
      Utils.repeatAnimation(widget.repeat, animationController,
          widget.reverse);
    }
    return AnimatedBuilder(animation: animationController, builder:(_,__){
      return ScaleTransition(scale: animationScale,child: widget.child,);
    });
  }
}



