import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm/data/app_exception.dart';
import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm/res/components/app_url.dart';
import 'package:http/http.dart' as http;

class Networkapiservices extends Baseapiservices {
  @override
  Future deleteApiResponse(String url) {
    // TODO: implement deleteApiResponse
    throw UnimplementedError();
  }

  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(
        "Network Error: Please check your internet connection.",
      );
    }
    return responseJson;
  }

  // @override
  // Future postApiResponse(String url, dynamic data) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http
  //         .post(
  //           Uri.parse(url),

  //           body: data,

  //         )
  //         .timeout(Duration(seconds: 10));
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException(
  //       "Network Error: Please check your internet connection.",
  //     );
  //   }
  //   return responseJson;
  // }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(data),
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "Bearer ${AppUrl.apiKey}", // ✅ Use API key from AppUrl
            },
          )
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(
        "Network Error: Please check your internet connection.",
      );
    }
    return responseJson;
  }

  @override
  Future putApiResponse(String url, data) {
    // TODO: implement putApiResponse
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          "Error occurred while communicating with the server with status code: ${response.statusCode}",
        );
    }
  }
}
