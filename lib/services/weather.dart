import 'location.dart';
import 'networking.dart';


const apiKey = 'bcb63990f52cb289b7fcb2b8b75bed6f' ;
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';



class WeatherModel {


  Future<dynamic> getCityWeather(String cityName) async{

    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
   NetworkHelper networkHelper = NetworkHelper(url);

   var weatherData = await networkHelper.getData();
   return weatherData;

  }

  Future<dynamic> getLocationWeather() async{

    Location myLocation = Location(); // location object from Location class that's get the current location

    await myLocation.getCurrentLocation(); // the function to get current location

    NetworkHelper netWorkHelper = NetworkHelper('$openWeatherMapURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric');

    var weatherData = await netWorkHelper.getData();

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
