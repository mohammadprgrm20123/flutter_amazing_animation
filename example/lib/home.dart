

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_animation/techniques.dart';
import 'package:flutter_module_animation/amazing_aniamtion.dart';


class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return HomeState();
  }

}


class HomeState extends State<Home>{

  bool playFadeIn=false;
  bool playFadeInLeft=false;
  bool playFadeInR=false;
  bool playFadeInD=false;
  bool playFadeInUp=false;
  bool playRotate=false;
  bool playRespective=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('animation'),),


      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            itemExtent: 60,
            primary: true,
            children: [
              //fade in
              GestureDetector(
                onTap: (){
                  playFadeIn = true;
                  setState(() {

                  });
                },
                child: Card(child: Center(child:
                AmazingAnimation(child: Text('FadeIn'),
                  techniques: Techniques.FadeIn,
                  duration: Duration(milliseconds: 100),repeat: 3, play: playFadeIn, reverse: true,)),),
              ),

              //fade in left
              GestureDetector(
                onTap: (){
                  playFadeInLeft = true;
                  setState(() {

                  });
                },
                child: Card(child: Center(child:
                AmazingAnimation(child: Text('FadeIn left'),
                  techniques: Techniques.FadeInLeft,
                  duration: Duration(milliseconds: 1000),repeat: 3, play: playFadeInLeft, reverse: true,)),),
              ),


              //fade in right
              GestureDetector(
                onTap: (){
                  playFadeInR = true;
                  setState(() {

                  });
                },
                child: Card(child: Center(child:
                AmazingAnimation(child: Text('FadeIn Right'),
                  techniques: Techniques.FadeInRight,
                  duration: Duration(milliseconds: 1000),repeat: 3, play: playFadeInR, reverse: true,)),),
              ),


              //fade in down
              GestureDetector(
                onTap: (){
                  playFadeInD = true;
                  setState(() {

                  });
                },
                child: Card(child: Center(child:
                AmazingAnimation(child: Text('FadeIn Down'),
                  techniques: Techniques.FadeInDown,
                  duration: Duration(milliseconds: 1000),repeat: 3, play: playFadeInD, reverse: false,
                )),),
              ),


              //fade in up
              GestureDetector(
                onTap: (){
                  playFadeInUp = true;
                  setState(() {

                  });
                },
                child: Card(child: Center(child:
                AmazingAnimation(child: Icon(Icons.flight),
                  techniques: Techniques.FadeInUp,
                  duration: Duration(milliseconds: 1000),repeat: 1, play: playFadeInUp, reverse: false,)),),
              ),

              //fade in up
              GestureDetector(
                onTap: (){
                  playRotate = true;
                  setState(() {

                  });
                },
                child: Card(child: Center(child:
                AmazingAnimation(child: Icon(Icons.arrow_upward_sharp),
                  techniques: Techniques.Rotate,
                  duration: Duration(milliseconds: 2000),repeat: 5, play: playRotate, reverse: true,
                )),),
              ),

              //respective
              GestureDetector(
                onTap: (){
                  playRespective = true;
                  setState(() {

                  });
                },
                child: Center(child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AmazingAnimation(child: CircleAvatar(child: Icon(Icons.card_giftcard),),//Container(child: SizedBox.shrink(),height: 100,width: 100,color: Colors.green,),
                    techniques: Techniques.Respective3D,
                    duration: Duration(milliseconds: 2000),repeat: 1, play: playRespective, reverse: false,),
                )),
              ),

            ],
          )

        ],
      ),
    );
  }

}