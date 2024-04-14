import 'package:flutter/material.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flappybird/oyun/assets.dart';

class OyunBittiEkrani extends StatelessWidget{
  final FlappyBirdOyunu game;
 
  const OyunBittiEkrani({Key? key, required this.game}) : super(key: key);
  
  @override
  Widget build(BuildContext context)=> Material(
    color: Colors.transparent,child: Center(
      child: Column(mainAxisSize: MainAxisSize.min,children: [Text("Skor = ${game.kus.skor}",style: const TextStyle(fontSize: 70,color: Colors.white,fontFamily: 'Pixels',fontWeight: FontWeight.w600),)
      , const SizedBox(height: 20),
      Image.asset(Assets.gameOver),
      const SizedBox(height: 20,),
      GestureDetector(onTap: onRestart,child: Container(height: 60,width:200, decoration: const BoxDecoration(image:DecorationImage(image:AssetImage(Assets.yenidenBaslatButonu),fit: BoxFit.fitWidth)),),)
      ],),
    ),
  );
  void onRestart(){
    game.kus.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
    
  

  
}