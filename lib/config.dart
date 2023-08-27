class Config {
  Config._inrtenal();

  static final Config _instance = Config._inrtenal();

  factory Config() => _instance;
}