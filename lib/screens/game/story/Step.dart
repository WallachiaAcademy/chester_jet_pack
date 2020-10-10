const int kRocket = 0;

class Step {
  final int spawnTime;
  final int entityType;
  final List<int> args;

  Step(this.spawnTime, this.entityType, this.args);
}
