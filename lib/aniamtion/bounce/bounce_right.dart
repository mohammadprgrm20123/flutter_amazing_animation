

import 'package:flutter/cupertino.dart';
import 'package:flutter_module_animation/utils/utils.dart';

class BounceRight extends StatefulWidget{


  final Widget child;
  final int repeat;
  final bool play;
  final Duration duration;
  final bool reverse;

  BounceRight(
      {required this.child,
        required this.repeat,
        required this.play,
        required this.duration,
        required this.reverse});



  @override
  State<StatefulWidget> createState() {
    return BounceRightState();
  }
}


class BounceRightState extends State<BounceRight> with SingleTickerProviderStateMixin{


  late Animation<double> scale;
  late Animation<Offset> transfer;

  late AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController =AnimationController(vsync: this,duration: widget.duration);
    scale = Tween(begin: 1.0,end: 1.5).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceIn));

    transfer = Tween<Offset>(begin: Offset.zero,end:Offset(0.5,0.0)).animate(animationController);
  }


  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      animationController.forward();
      Utils.repeatAnimation(widget.repeat, animationController, widget.reverse);
    }
    return SlideTransition(
      position: transfer,
      child: ScaleTransition(
          scale: scale,
          alignment: Alignment.topRight,
          child: widget.child),
    );

  }



}