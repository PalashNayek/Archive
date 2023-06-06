import 'package:http/http.dart' as http;

import 'api_const.dart';

class APICall {
  Future<http.Response> getSearchList() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(Uri.parse(APIConst.search),
        headers: headers);
  }
}
