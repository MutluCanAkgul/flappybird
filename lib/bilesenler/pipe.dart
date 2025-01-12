import 'package:flappybird/oyun/pipeposition.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flappybird/oyun/configuration.dart';
import 'package:flappybird/oyun/assets.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdOyunu>{
  Pipe({
    required this.pipePosition,
    required this.height
  });

  @override
  final double height;
  final PipePosition pipePosition;

  Future<void> onLoad() async{
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);

    size = Vector2(50, height);
    switch(pipePosition){
      case PipePosition.top:
      position.y = 0;
      sprite = Sprite(pipeRotated);
      break;
      case PipePosition.bottom:
      position.y = gameRef.size.y - size.y -Config.zeminYuksekligi;
      sprite = Sprite(pipe);
      break;
    }
    add(RectangleHitbox());
  }
}