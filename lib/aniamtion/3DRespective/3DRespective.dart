import 'package:flutter/widgets.dart';
import 'package:flutter_module_animation/animation_widget.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/utils/utils.dart';

class Respective3D extends AnimationWidget {
  AnimationParameters animationParameters;
  late Animation<double> rotateAnimation;
  late Animation<int> fadeInAnimation;
  Respective3D({required this.animationParameters});


  @override
  Widget animatedBuilder(BuildContext context, AnimationController animationController) {
    initAnimation(animationController);

    if (animationParameters.play) {
      animationController.forward();
      Utils.repeatAnimation(animationParameters.repeat, animationController, animationParameters.reverse);
    }
    return AnimatedBuilder(
        animation: animationController,
        builder: (_, w) {
          print(rotateAnimation.value.toString());
          return Transform(
            transform: Matrix4.identity()
              ..rotateX(rotateAnimation.value)

            alignment: FractionalOffset.center,
            child: animationParameters.child,
          );
        });  }

  @override
  void initAnimation(AnimationController animationController) {
    rotateAnimation =
        new Tween<double>(begin: 0.0, end: 10.0).animate(animationController);
  }
}

