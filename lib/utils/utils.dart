


import 'package:flutter/animation.dart';

class Utils {


 static void repeatAnimation(int repeat,AnimationController animationController,bool reverse) async {
    for(int i=0;i<repeat;i++){
      await animationController.forward();
      if(reverse)
        await animationController.reverse();
      else
        animationController.reset();
    }
  }
}