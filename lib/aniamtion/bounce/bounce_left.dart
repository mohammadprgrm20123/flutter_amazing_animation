import 'package:flutter/cupertino.dart';
import 'package:flutter_module_animation/utils/utils.dart';

class BounceLeft extends StatefulWidget {
  final Widget child;
  final int repeat;
  final bool play;
  final Duration duration;
  final bool reverse;

  BounceLeft(
      {required this.child,
      required this.repeat,
      required this.play,
      required this.duration,
      required this.reverse});

  @override
  State<StatefulWidget> createState() {
    return BounceLeftState();
  }
}

class BounceLeftState extends State<BounceLeft>
    with SingleTickerProviderStateMixin {
  late Animation<double> scale;
  late AnimationController controller;
  late Animation<Offset> offSet;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration:  widget.duration);

    scale = Tween(begin: 1.0, end: 1.5).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn
    ));

    offSet = Tween<Offset>(begin: Offset.zero,end: Offset(-0.3,0.0)).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      controller.forward();
      Utils.repeatAnimation(widget.repeat, controller, widget.reverse);
    }
    return SlideTransition(
      position: offSet,
      child: ScaleTransition(
          scale: scale,
          alignment: Alignment.topLeft,
          child: widget.child),
    );
  }
}
