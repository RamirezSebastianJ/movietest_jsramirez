class Environment {
  final String apiUrl;
  final String apiKey;
  final String apiVersion;
  final String imagePrefix;
  Environment({
    required this.apiKey,
    required this.apiVersion,
    required this.apiUrl,
    required this.imagePrefix,
  });
}

class Dev implements Environment {
  @override
  String apiUrl = 'https://api.themoviedb.org/';

  @override
  String apiKey = 'fd4c25c2f0665141e89d2d389472f84e';

  @override
  String apiVersion = '3';

  @override
  String imagePrefix = 'https://image.tmdb.org/t/p/w500/';
}

class CurrentEnvironment {
  static Environment environment = Dev();
}
