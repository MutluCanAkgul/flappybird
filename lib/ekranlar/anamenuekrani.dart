import 'package:flutter/material.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flappybird/oyun/assets.dart';

class AnaMenuEkrani extends StatelessWidget{
  final FlappyBirdOyunu game;
  static const String id = 'AnaEkran';

  const AnaMenuEkrani({
    Key? key,
    required this.game
  }):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(onTap:(){
         game.overlays.remove('AnaEkran');
         game.resumeEngine();
      }
      ,child:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image:
          AssetImage(Assets.menu),fit: BoxFit.cover)
        ),
        child: Image.asset(Assets.message),
      )
      )
     
    );
  }

  
}
