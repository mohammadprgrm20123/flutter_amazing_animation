
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

abstract class AnimationWidget{
  void initAnimation(AnimationController animationController);
  Widget animatedBuilder(BuildContext context,AnimationController animationController);
}