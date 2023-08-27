class Wheather {
  final String lastUpdated;
  final String cityName;
  final double tempC;
  final double feelsLikeC;
  final String condition;

  Wheather({
    required this.lastUpdated,
    required this.cityName,
    required this.tempC,
    required this.feelsLikeC,
    required this.condition,
  });

  factory Wheather.fromJson(Map<String, dynamic> json) {
    final currentData = json['current'];
    final conditionData = currentData['condition'];
    return Wheather(
      lastUpdated: currentData['last_updated'], 
      cityName: json['location']['name'], 
      tempC: currentData['temp_c'].toDouble(), 
      feelsLikeC: currentData['feelslike_C'].toDouble(),
      condition: conditionData['text'],
      );
  }
}