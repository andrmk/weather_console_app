class Config {
  Config._inrtenal();

  static final Config _instance = Config._inrtenal();

  factory Config() => _instance;

  String apiKey = '66b1a3a401194f2eb89135813232708 ';

  String baseUrl = 'http://api.weatherapi.com/v1';
  String currentUrl = 'current.json';
  String forecastUrl = 'forecast.json';
}