class Endpoints {
  Endpoints._();

  static String weatherUrl(String city) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=5604825db9463c1b62ac0fcbe5d3781f';
}
