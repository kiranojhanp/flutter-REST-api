import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    String data;

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;

      // int condition = decodedData['weather'][0]['id'];
      // double temperature = decodedData['main']['temp'];
      // String cityName = decodedData['name'];

      // print('$condition $temperature $cityName');
    } else {
      print(response.statusCode);
    }
  }
}
