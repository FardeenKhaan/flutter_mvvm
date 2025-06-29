import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm/data/network/NetworkApiServices.dart';
import 'package:flutter_mvvm/res/components/app_url.dart';

class AuthRepository {
  final Baseapiservices _ApiService = Networkapiservices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _ApiService.postApiResponse(
        AppUrl.LoginUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> RegisterApi(dynamic data) async {
    try {
      dynamic response = await _ApiService.postApiResponse(
        AppUrl.RegisterUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
