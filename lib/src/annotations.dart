class GameState {
  final String name;
  final List<Asset> assets;

  const GameState(this.name, {this.assets: const []});
}

class Asset {
  final String type, name, url;
  final int frameWidth, frameHeight;
  const Asset(
      {this.type: 'spritesheet',
      this.name,
      this.url,
      this.frameWidth: 32,
      this.frameHeight: 48});
}
