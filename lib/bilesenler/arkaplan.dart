import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flappybird/oyun/assets.dart';
class Background extends SpriteComponent with HasGameRef<FlappyBirdOyunu>{
  Background();

  @override 
  Future<void> onLoad() async{
   final background = await Flame.images.load(Assets.arkaplan);
   size = gameRef.size;
   sprite = Sprite(background);
  }
}