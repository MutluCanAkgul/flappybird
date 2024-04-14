import 'package:flame/game.dart';
import 'package:flappybird/ekranlar/anamenuekrani.dart';
import 'package:flappybird/ekranlar/gameOverScreen.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flutter/material.dart';

void main() {
  final oyun = FlappyBirdOyunu();
  runApp(
     GameWidget(
      game: oyun,
     initialActiveOverlays:const [AnaMenuEkrani.id],
     overlayBuilderMap:{
      'AnaEkran' : (context, _) => AnaMenuEkrani(game: oyun),
      'gameOver' : (context, _) => OyunBittiEkrani(game: oyun)
     }
  ));
}

