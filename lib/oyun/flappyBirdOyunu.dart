import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappybird/bilesenler/arkaplan.dart';
import 'package:flame/game.dart';
import 'package:flappybird/bilesenler/zemin.dart';
import 'package:flappybird/bilesenler/kus.dart';
import 'package:flappybird/bilesenler/pipegroup.dart';
import 'package:flappybird/oyun/configuration.dart';
import 'package:flutter/painting.dart';
class FlappyBirdOyunu extends FlameGame with TapDetector,HasCollisionDetection{
  late Kus kus;
  late TextComponent skor;
  Timer interval = Timer(Config.pipeInterval, repeat:true);
  bool carpismaVarMi = false;
Future<void> onLoad() async{
  addAll([
    Background(),
    Zemin(),
    kus = Kus(),
    PipeGroup(),
    skor = buildSkor()
  ]);
  interval.onTick =() => add(PipeGroup());
}
TextComponent buildSkor(){
return TextComponent(
  text: "0",
  position: Vector2(size.x / 2,size.y / 2 * 0.2),
  anchor: Anchor.center,
  textRenderer: TextPaint(
    style:const TextStyle(fontSize: 70,fontFamily:'Pixels',fontWeight: FontWeight.w600)
  )
  
);

}
@override
void onTap(){
  kus.fly();
}

@override
void update(double dt){
  super.update(dt);
  interval.update(dt);
  skor.text = '${kus.skor}';
}
}
