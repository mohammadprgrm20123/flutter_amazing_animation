import 'package:flutter/material.dart';
import 'package:flutter_module_animation/utils/utils.dart';
import 'package:flutter/cupertino.dart';


class ElasticRight extends StatefulWidget {


  final Widget child;
  final int repeat;
  final bool play;
  final Duration duration;
  final bool reverse;
  ElasticRight({required this.repeat,required this.child, required this.play, required this.duration, required this.reverse});


  @override
  State<StatefulWidget> createState() {
    return ElasticRightState();
  }
}

class ElasticRightState extends State<ElasticRight> with SingleTickerProviderStateMixin{


  late Animation<double> animationScale;
  late AnimationController animationController;
  late Animation<Offset> offSet;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this,duration:widget.duration);
    animationScale = Tween<double>(begin: 1.0,end:1.3).animate(CurvedAnimation(parent: animationController, curve: Curves.elasticOut));
    offSet = Tween<Offset>(begin: Offset.zero,end: Offset(0.3,0.0)).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      animationController.forward();
      Utils.repeatAnimation(widget.repeat, animationController,
          widget.reverse);
    }




    return SlideTransition(

        position: offSet,
        child: ScaleTransition(scale: animationScale,child: widget.child,));
  }
}



