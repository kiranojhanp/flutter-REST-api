import 'package:rest_api_test/services/location.dart';
import 'package:rest_api_test/services/networking.dart';

const apiKey = "d9c67e9622798cba106e3991a7eded8a";
const openWeatherMapURL = "http://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric";

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherDataByCity = await networkHelper.getData();

    return weatherDataByCity;
  }

  Future<dynamic> getLocationWeather() async {
    // Get location data using location service
    Location location = Location();
    await location.getCurrentLocation();

    // Get weather data using open weather api and weather data from above
    String url =
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric";

    NetworkHelper networkHelper = NetworkHelper(url);
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
      return 'Bring a 🎽 just in case';
    }
  }
}
