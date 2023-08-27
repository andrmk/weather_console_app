void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Syntax error: dart bin/main.dart <city>');
    return;
  }

  final cityName = arguments.first;
  print(cityName);
}
