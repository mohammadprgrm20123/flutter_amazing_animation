import 'package:flutter/material.dart';
import 'package:flutter_module_animation/utils/utils.dart';
import 'package:flutter/cupertino.dart';


class ElasticOut extends StatefulWidget {


  final Widget child;
  final int repeat;
  final bool play;
  final Duration duration;
  final bool reverse;
  ElasticOut({required this.repeat,required this.child, required this.play, required this.duration, required this.reverse});


  @override
  State<StatefulWidget> createState() {
    return ElasticOutState();
  }
}

class ElasticOutState extends State<ElasticOut> with SingleTickerProviderStateMixin{


  late Animation<double> animationScale;
  late AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this,duration:widget.duration);
    animationScale = Tween<double>(begin: 1.0,end:1.3).animate(CurvedAnimation(parent: animationController, curve: Curves.elasticOut));

  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      animationController.forward();
      Utils.repeatAnimation(widget.repeat, animationController,
          widget.reverse);
    }




      return ScaleTransition(scale: animationScale,child: widget.child,);
  }
}



