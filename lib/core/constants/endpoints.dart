class Endpoints {
  const Endpoints._();

  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  static const String getRandomMeal = '$_baseUrl/random.php';
}
