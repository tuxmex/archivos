import 'package:http/http.dart' as http;

class Repository {
  String _baseUrl = "http://192.168.1.73:3000/api";
  httpGet(String api) async {
    return await http.get(this._baseUrl + api);
  }
}
