

import 'package:flutter/cupertino.dart';
import 'package:flutter_module_animation/aniamtion/3DRespective/3DRespective.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_down.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_right.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_up.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_new.dart';
import 'package:flutter_module_animation/aniamtion/rotate/rotate.dart';
import 'package:flutter_module_animation/models/aniamtion_parameters.dart';
import 'package:flutter_module_animation/techniques.dart';

import 'aniamtion/fade/FadeInLeft.dart';


class AmazingAnimation extends StatefulWidget{
  final Widget child;
  final int repeat;
  final Techniques techniques;
  final bool play;
  final Duration duration;
  final bool reverse ;
  AmazingAnimation({ required this.child ,required this.repeat,required this.play,required this.techniques,required this.duration,required this.reverse}):
        assert(repeat > 0);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AmazingAnimationState();
  }

}


class AmazingAnimationState extends State<AmazingAnimation> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(vsync: this,duration: widget.duration);
  }
  @override
  Widget build(BuildContext context) {

    AnimationParameters animationParameters = AnimationParameters(widget.child, widget.repeat, widget.techniques, widget.play, widget.duration, widget.reverse);



    switch(widget.techniques){
      case Techniques.FadeIn:{
        return FadeIn(animationParameters: animationParameters).animatedBuilder(context,controller);//Fade(animationParameters: animationParameters,);
      }
      case Techniques.FadeInLeft:{
        return FadeInLeft(animationParameters: animationParameters,).animatedBuilder(context, controller);
      }

      case Techniques.FadeInRight:{
        return FadeInRight(animationParameters: animationParameters).animatedBuilder(context, controller);
      }
      case Techniques.FadeInDown:{
        return FadeInDown(animationParameters: animationParameters).animatedBuilder(context,controller);
      }

      case Techniques.FadeInUp:{
        return FadeInUp(animationParameters: animationParameters,).animatedBuilder(context, controller);
      }

      case Techniques.Rotate:{
        return Rotate(animationParameters: animationParameters,).animatedBuilder(context, controller);
      }

      case Techniques.Respective3D:{
        return Respective3D(animationParameters: animationParameters,).animatedBuilder(context, controller);
      }

      default: {
        //statements;
      }
      break;
    }
    return SizedBox.shrink();
  }


}

