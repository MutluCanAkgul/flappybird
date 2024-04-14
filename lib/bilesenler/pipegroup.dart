import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/oyun/assets.dart';
import 'package:flappybird/oyun/pipeposition.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flappybird/oyun/configuration.dart';
import 'package:flappybird/bilesenler/pipe.dart';
import 'package:flame/components.dart';
import 'dart:math';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdOyunu>{
  PipeGroup();
  final random = Random();
  
  double spacing = 140.0; 
  
  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.zeminYuksekligi;
    final centerY = spacing + random.nextDouble() * (heightMinusGround - spacing); 
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom,height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt){
    super.update(dt);
    position.x -= Config.oyunHizi * dt;
    if(position.x < -10){
      removeFromParent();
      updateSkor();
    }
    if(game.carpismaVarMi){
      removeFromParent();
      gameRef.carpismaVarMi = false;
    }
  }
  
  void updateSkor(){
    gameRef.kus.skor += 1;
    FlameAudio.play(Assets.puanSesi);
  }
}