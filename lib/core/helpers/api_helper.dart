import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:hero_premier/core/helpers/secured_storage_helper.dart';
import 'package:hero_premier/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ApiBaseHelper {
  final String _baseUrl = "https://premierhero.com";
  String token;

  Future<String> getToken() async {
    SecuredStorageHelper storage = SecuredStorageHelper();
    return storage.get(key: KEY_TOKEN);
  }

  Future<dynamic> get(String url, {String wholeUrl}) async {
    var responseJson;
    try {
      final response = await http.get(wholeUrl ?? _baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {Map<String, dynamic> params}) async {
    var token = await getToken();
    var responseJson;
    try {
      final response = await http.post(
        _baseUrl + url,
        headers: {'Authorization': token},
        body: params,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException({"message": 'No Internet connection'});
    }
    return responseJson;
  }

  Future<dynamic> patch(String url, {Map<String, dynamic> params}) async {
    print('the params $params');
    var token = await getToken();
    var responseJson;
    try {
      final response = await http.patch(
        _baseUrl + url,
        headers: {'Authorization': token},
        body: params,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException({"message": 'No Internet connection'});
    }
    return responseJson;
  }

  Future<dynamic> multipart(String url, {Map<String, dynamic> params}) async {
    var responseJson;
    try {
      var token = await getToken();
      var request = http.MultipartRequest("PATCH", Uri.parse(_baseUrl + url));
      request.headers.addAll({
        HttpHeaders.contentTypeHeader: "multipart/form-data",
        HttpHeaders.authorizationHeader: token
      });
      //add text fields
      request.fields["userId"] = params['userId'];
      String mimeType = lookupMimeType(params['image'].path);
      var fileType = mimeType.split('/');
      var pic = await http.MultipartFile.fromPath(
        "image",
        params['image'].path,
        contentType: MediaType(fileType[0], fileType[1]),
      );
      //add multipart to request
      request.files.add(pic);
      var streamResponse = await request.send();
      final response = await http.Response.fromStream(streamResponse);
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
