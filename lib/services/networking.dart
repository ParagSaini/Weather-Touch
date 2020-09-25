import 'package:http/http.dart' as http;
import 'dart:convert'; // to use the jsonDecode into string.

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('error code: ${response.statusCode}');
    }
    return null;
  }
}
