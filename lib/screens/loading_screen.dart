import 'package:flutter/material.dart';
import 'package:rest_api_test/services/location.dart';
import 'package:rest_api_test/services/networking.dart';

const apiKey = "d9c67e9622798cba106e3991a7eded8a";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude, longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // Get location data using location service
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    // Get weather data using open weather api and weather data from above
    String url =
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    // Print current location data
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
