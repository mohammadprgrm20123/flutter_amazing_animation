import 'package:flutter/widgets.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';

class Respective3D extends StatefulWidget {
  AnimationParameters animationParameters;

  Respective3D({required this.animationParameters});

  @override
  State<StatefulWidget> createState() {
    return Respective3DState();
  }
}

class Respective3DState extends State<Respective3D>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> rotateAnimation;
  late Animation<int> fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: widget.animationParameters.duration);
    rotateAnimation =
        new Tween<double>(begin: 0.0, end: 10.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animationParameters.play) {
      _animationController.forward();
      repeatAnimation();
    }
    return AnimatedBuilder(
        animation: _animationController,
        builder: (_, w) {
          print(rotateAnimation.value.toString());
          return Transform(
            transform: Matrix4.identity()
              ..rotateX(rotateAnimation.value)
              ..rotateY(rotateAnimation.value)
              ..rotateZ(rotateAnimation.value),
            alignment: FractionalOffset.center,
            child: widget.animationParameters.child,
          );
        });
  }

  void repeatAnimation() async {
    for (int i = 0; i < widget.animationParameters.repeat; i++) {
      await _animationController.forward();
      if (widget.animationParameters.reverse)
        await _animationController.reverse();
      else
        _animationController.reset();
    }
  }
}
