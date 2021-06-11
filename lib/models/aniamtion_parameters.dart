

import 'package:flutter/material.dart';
import 'package:flutter_module_animation/techniques.dart';

class AnimationParameters {

   late Widget _child;
   late int _repeat;
   late Techniques _techniques;
   late bool _play;
   late Duration _duration;
   late bool _reverse;


   AnimationParameters(
      this._child, this._repeat, this._techniques, this._play, this._duration,this._reverse);

   bool get reverse => _reverse;

  set reverse(bool value) {
    _reverse = value;
  }

  Widget get child => _child;

  set child(Widget value) {
    _child = value;
  }

   int get repeat => _repeat;

  set repeat(int value) {
    _repeat = value;
  }

   Techniques get techniques => _techniques;

  set techniques(Techniques value) {
    _techniques = value;
  }

   bool get play => _play;

  set play(bool value) {
    _play = value;
  }

   Duration get duration => _duration;

  set duration(Duration value) {
    _duration = value;
  }
}