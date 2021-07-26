import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    try {
      http.Response response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodeData = jsonDecode(data);
        return decodeData;
      } else {
        print('statusCode${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
