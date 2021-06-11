

import 'package:flutter/cupertino.dart';
import 'package:flutter_module_animation/aniamtion/3DRespective/3DRespective.dart';
import 'package:flutter_module_animation/aniamtion/fade/FadeIn.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_down.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_right.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_up.dart';
import 'package:flutter_module_animation/aniamtion/rotate/rotate.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/techniques.dart';

import 'aniamtion/fade/FadeInLeft.dart';

class AmazingAnimation extends StatelessWidget{

  final Widget child;
  final int repeat;
  final Techniques techniques;
  final bool play;
  final Duration duration;
  final bool reverse ;

  AmazingAnimation({ required this.child ,required this.repeat,required this.play,required this.techniques,required this.duration,required this.reverse}):
  assert(repeat > 0);


  @override
  Widget build(BuildContext context) {

    AnimationParameters animationParameters = AnimationParameters(child, repeat, techniques, play, duration, reverse);

    switch(this.techniques){
      case Techniques.FadeIn:{
        return Fade(animationParameters: animationParameters,);
      }
      case Techniques.FadeInLeft:{
        return FadeInLeft(animationParameters: animationParameters,);
      }
      case Techniques.FadeInRight:{
        return FadeInRight(animationParameters: animationParameters,);
      }
      case Techniques.FadeInDown:{
        return FadeInDown(animationParameters: animationParameters,);
      }

      case Techniques.FadeInUp:{
        return FadeInUp(animationParameters: animationParameters,);
      }

      case Techniques.Rotate:{
        return Rotate(animationParameters: animationParameters,);
      }

      case Techniques.Respective3D:{
        return Respective3D(animationParameters: animationParameters,);
      }

      default: {
        //statements;
      }
      break;
    }
    return SizedBox.shrink();
  }


}

