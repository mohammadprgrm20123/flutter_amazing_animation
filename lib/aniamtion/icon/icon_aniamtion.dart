import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/utils/utils.dart';

class IconAnimation extends StatefulWidget {
  final Icon fistIcon;
  final Icon secondIcon;
  final bool play;
  final Duration duration;

  IconAnimation(
      {required this.fistIcon,
      required this.secondIcon,
      required this.play,
      required this.duration});

  @override
  State<StatefulWidget> createState() {
    return IconAnimationState();
  }
}

class IconAnimationState extends State<IconAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> scale;
  late AnimationController controller;

  late Widget icon;

  @override
  void initState() {
    super.initState();

    icon = widget.fistIcon;
    controller = AnimationController(vsync: this, duration: widget.duration);

    scale = Tween(begin: 1.0, end: 0.0).animate(controller)..addListener(() {
      if(controller.isCompleted)
        controller.reverse();

      if(controller.isDismissed)
        controller.forward();

    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
      controller.forward();
    }    return AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          print(controller.value.toString());
          if (controller.isCompleted)
          {
            icon = widget.fistIcon;
            controller.reverse();
           // setState(() {});
          }
          if(controller.isDismissed)
          {
            icon = widget.secondIcon;
            controller.forward();
          }

          return ScaleTransition(
            scale: scale,
            child: icon,
          );
        });
  }
}
