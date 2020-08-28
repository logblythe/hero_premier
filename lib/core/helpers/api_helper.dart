import 'dart:convert';
import 'dart:io';

import 'package:hero_premier/core/helpers/shared_pref_helper.dart';
import 'package:hero_premier/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  final String _baseUrl = "https://dev.premierhero.com";
  String token;

  Future<String> getToken() async {
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(KEY_TOKEN);
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {Map<String, dynamic> params}) async {
    print('the params $params');
    var token = await getToken();
    var responseJson;
    try {
      final response = await http.post(_baseUrl + url,
          headers: {
            'Authorization': token,
          },
          body: params);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException({"message": 'No Internet connection'});
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(json.decode(response.body.toString()));
      case 401:
      case 403:
        throw UnauthorisedException(json.decode(response.body.toString()));
      case 404:
        throw NotFoundException({"message": "Requested url is not available"});
      case 500:
      default:
        throw FetchDataException({
          "message":
              'Error occurred while Communication with Server with StatusCode : ${response.statusCode}'
        });
    }
  }
}
