import 'package:flame/collisions.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flame/components.dart';
import 'package:flappybird/oyun/assets.dart';
import 'package:flappybird/oyun/flappyBirdOyunu.dart';
import 'package:flappybird/oyun/configuration.dart';

class Zemin extends ParallaxComponent<FlappyBirdOyunu>with HasGameRef<FlappyBirdOyunu>{ 
  Zemin();

@override
Future<void> onLoad() async{
  final zemin = await Flame.images.load(Assets.zemin);
  parallax =  Parallax([
   ParallaxLayer(
    ParallaxImage(zemin,fill: LayerFill.none)
   )
  ]);

  add(
    RectangleHitbox(
      position: Vector2(0, gameRef.size.y - Config.zeminYuksekligi),
      size: Vector2(gameRef.size.x, Config.zeminYuksekligi),
      ),
      );
  
  @override
  void update(double dt){
    super.update(dt);
    parallax?.baseVelocity.x = Config.oyunHizi;
  }
}
}