import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'd069ed46eaa415ecba6664ab1b8aebbe';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModels {

  Future<dynamic> getCityWeather(String cityName) async {
    var utl = '$openWeatherMapURL?q=$cityName&appid=$apiKey';
    NetworkHelper network = NetworkHelper(url: utl);

    var weatherData2 = await network.getData();
    return weatherData2;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    print('tryto get location');
    await location.getCurrentLocation();

    NetworkHelper network = NetworkHelper(
        url: '$openWeatherMapURL?lat=51.5&lon=-0.2&appid=$apiKey');

    var weatherData = await network.getData();

    print(weatherData);

    return weatherData;
  }
}

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
