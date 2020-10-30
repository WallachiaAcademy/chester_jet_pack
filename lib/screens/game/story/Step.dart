import 'package:chesterjetpack/screens/game/entities/EntityType.dart';

class Step {
  final double spawnTime;
  final EntityType entityType;
  final List<double> args;

  Step(this.spawnTime, this.entityType, this.args);
}
