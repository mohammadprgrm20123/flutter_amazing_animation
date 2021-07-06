import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/aniamtion/bounce/bounce_in.dart';
import 'package:flutter_module_animation/aniamtion/bounce/bounce_left.dart';
import 'package:flutter_module_animation/aniamtion/bounce/bounce_out.dart';
import 'package:flutter_module_animation/aniamtion/bounce/bounce_right.dart';
import 'package:flutter_module_animation/aniamtion/elastic/elasticIn.dart';
import 'package:flutter_module_animation/aniamtion/elastic/elastic_left.dart';

import 'package:flutter_module_animation/aniamtion/fade/fade_in_down.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_left.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_right.dart';
import 'package:flutter_module_animation/aniamtion/fade/fade_in_up.dart';
import 'package:flutter_module_animation/aniamtion/zoom/zoom.dart';
import 'package:flutter_module_animation/aniamtion/elastic/elastic_right.dart';
import 'package:flutter_module_animation/aniamtion/elastic/elastic_out.dart';

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool playFadeIn = false;
  bool playFadeInLeft = false;
  bool playFadeInR = false;
  bool playFadeInD = false;
  bool playFadeInUp = false;
  bool playRotate = false;
  bool playRespective = false;
  bool play = false;

  late AnimationController controller;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));


  }



  @override
  Widget build(BuildContext context) {
     controller.forward();
    return Scaffold(
        appBar: AppBar(
          title: Text('animation'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {


          if(play==true){

            setState(() {
              play=false;
              controller.reverse();
            });
          }
          else{

            setState(() {
              play=true;
              controller.forward();
            });
          }
        },
        child:AnimatedIcon(icon: AnimatedIcons.play_pause, progress: controller,),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.green,
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        play = true;
                        controller.forward();
                        setState(() {});
                      },
                      child: Text('StartAniamtion')),
                ),
                FadeInDown(
                  repeat: 1,
                  child: Icon(Icons.access_time),
                  play: play,
                  duration: Duration(milliseconds: 1000),
                  reverse: true,
                ),
              const  SizedBox(width: 50,),
                FadeInRight(
                  repeat: 1,
                  child: Card(child: Icon(Icons.arrow_back)),
                  play: play,
                  duration: Duration(milliseconds: 1000),
                  reverse: true,
                ),
                const SizedBox(
                  width: 50,
                  height: 100,
                ),
                FadeInUp(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('FadeInUp'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 1000),
                    reverse: true),
                const SizedBox(
                  width: 50,
                  height: 100,
                ),
                FadeInLeft(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('FadeInLeft'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 1000),
                    reverse: true),
                const SizedBox(
                  width: 50,
                  height: 100,
                ),
                Zoom(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Zoom'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 1000),
                    reverse: true),
                const SizedBox(
                  width: 50,
                  height: 100,
                ),
                BounceIn(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('BounceIn'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 200),
                    reverse: true),
                const SizedBox(
                  width: 50,
                  height: 100,
                ),
                BounceOut(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('BounceOut'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 500),
                    reverse: true),
                const SizedBox(
                  width: 50,
                ),
                const SizedBox(
                  width: 50,
                ),
                BounceLeft(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('BounceLeft'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 500),
                    reverse: true),
                const SizedBox(
                  width: 50,
                ),
                BounceRight(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('BounceRight'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 500),
                    reverse: true),
                space(),
                ElasticIn(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('ElasticIn'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 500),
                    reverse: true),
                space(),
                ElasticOut(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('ElasticOut'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 500),
                    reverse: true),
                space(),
                ElasticLeft(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('ElasticLeft'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 500),
                    reverse: true),


                space(),
                ElasticRight(
                    repeat: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('ElasticRight'),
                    ),
                    play: play,
                    duration: Duration(milliseconds: 500),
                    reverse: true),

              ],
            ),
          ),
        ));
  }
}

Widget space() {
  return SizedBox(
    width: 100,
  );
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller; // انیمیشن اصلی دریافت کننده کنترلر
  final Animation<double> opacity; // انیمیشن کنترل کننده میزان شفافیت
  final Animation<double> width; // انیمیشن کنترل کننده عرض ویجت
  final Animation<double> height; // انیمیشن کنترل کننده ارتفاع ویجت
  final Animation<EdgeInsets> padding; // انیمیشن کنترل کننده فاصله از داخل
  final Animation<
      BorderRadius> borderRadius; // انیمیشن کنترل کننده گردی گوشه های حاشیه
 // final Animation<Color> color; // انیمیشن کنترل کننده رنگ ویجت
  StaggerAnimation(
      {required this.controller}) // سازنده کلاس
      : // مقداردهی اولیه به سایر انیمیشن ها
        opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
            new CurvedAnimation(
              // اتصال این انیمیشن با انیمیشن اصلی که حاوی کنترلر هست توسط خصوصیت Parent
                parent: controller,
                curve: new Interval(0.0, 0.150, curve: Curves.ease))),
        width = Tween<double>(begin: 50.0, end: 200.0).animate(
            new CurvedAnimation(
                parent: controller,
                curve: new Interval(0.150, 0.200, curve: Curves.ease))),
        height = Tween<double>(begin: 50.0, end: 200.0).animate(
            new CurvedAnimation(
                parent: controller,
                curve: new Interval(0.350, 0.500, curve: Curves.ease))),
        padding = EdgeInsetsTween(
            begin: const EdgeInsets.only(bottom: 16),
            end: const EdgeInsets.only(bottom: 150))
            .animate(new CurvedAnimation(
            parent: controller,
            curve: new Interval(0.350, 0.500, curve: Curves.ease))),
        borderRadius = BorderRadiusTween(
            begin: BorderRadius.circular(5), end: BorderRadius.circular(100))
            .animate(new CurvedAnimation(
            parent: controller,
            curve: new Interval(0.500, 0.700, curve: Curves.ease)));




  // تابع سازنده ویجت
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: controller, // تعیین کنترلر
      builder: _buildAnimation, // تعیین ویجت مورد نظر جهت اجرای انیمیشن
    );
  }

  Widget _buildAnimation(BuildContext context,child){
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.indigo, width: 3),
              borderRadius: borderRadius.value),
        ),
      ),
    );
  }
  
}
