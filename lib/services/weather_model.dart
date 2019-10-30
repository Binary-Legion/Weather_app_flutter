

import 'location.dart';
import 'networking.dart';

const apiKey = '4213cca339705480647b55d4cdafcf9b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async
  {

    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  Future<dynamic> getLocationWeather() async
  {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'thunderstorm.png';
    } else if (condition < 400) {
      return 'shower_rain.png';
    } else if (condition < 600) {
      return 'shower_rain.png';
    } else if (condition < 700) {
      return 'snow.png';
    } else if (condition < 800) {
      return 'mist.png';
    } else if (condition == 800) {
      return 'clear_sky.png';
    } else if (condition <= 804) {
      return 'few_clouds.png';
    } else {
      return 'broken_clouds.png';
    }
  }

}
