import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/oyun/kushareketi.dart';
import 'package:flame/components.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flappybird/oyun/assets.dart';
import 'package:flappybird/oyun/configuration.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
class Kus extends SpriteGroupComponent<KusHareketi>with HasGameRef<FlappyBirdOyunu>,CollisionCallbacks {
  Kus();
  int skor = 0;
  @override
  Future<void> onLoad() async{
   final birdMidFlap = await gameRef.loadSprite(Assets.birdMid);
   final birdUpFlap = await gameRef.loadSprite(Assets.birdUp);
   final birdDownFlap = await gameRef.loadSprite(Assets.birdDown);
   gameRef.kus;
   size = Vector2(50,40);
   position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
   current = KusHareketi.middle;
   sprites = {
    KusHareketi.middle:birdMidFlap,
    KusHareketi.up:birdUpFlap,
    KusHareketi.down:birdDownFlap
   };

   add(CircleHitbox());
  }
   void fly(){
    add(
      MoveByEffect(
        Vector2(0,Config.gravity),
        EffectController(duration: 0.2,curve: Curves.decelerate),
        onComplete: ()=> current = KusHareketi.down
       )
     );
     FlameAudio.play(Assets.ucusSesi);
    current = KusHareketi.up;
   }
  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,  
  ){
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }
  void reset(){
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    skor = 0;
  }
  void gameOver(){
    FlameAudio.play(Assets.carpismaSesi);
     game.carpismaVarMi = true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
   
  }

  @override
  void update(double dt){
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if(position.y < 1){
      gameOver();
    }
  }
}