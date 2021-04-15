import 'package:clima/services/location.dart';
import '../services/networking.dart';

const String apiKey = 'you api key';
const String openWeatherMapURL = 'api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = 'https://$openWeatherMapURL?q=$cityName&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url);
    var cityWeather = await networkHelper.getData();
    return cityWeather;
  }

  Future<dynamic> getLocationWeather() async {
    Location userLocation = Location();
    await userLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://$openWeatherMapURL?lat=${userLocation.latitude}&lon=${userLocation.longitude}&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
