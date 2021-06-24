import 'package:flutter/cupertino.dart';
import 'package:flutter_module_animation/utils/utils.dart';

class BounceIn extends StatefulWidget {
  final Widget child;
  final int repeat;
  final bool play;
  final Duration duration;
  final bool reverse;

  BounceIn(
      {required this.child,
      required this.repeat,
      required this.play,
      required this.duration,
      required this.reverse});

  @override
  State<StatefulWidget> createState() {
    return BounceInState();
  }
}

class BounceInState extends State<BounceIn>
    with SingleTickerProviderStateMixin {
  late Animation<double> scale;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    scale = Tween(begin: 1.0, end: 1.3).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      controller.forward();
      Utils.repeatAnimation(widget.repeat, controller, widget.reverse);
    }
    return ScaleTransition(
        scale: scale, alignment: Alignment.center, child: widget.child);
  }
}
