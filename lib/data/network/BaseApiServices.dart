abstract class Baseapiservices {
  Future<dynamic> getApiResponse(String url);

  Future<dynamic> postApiResponse(String url, dynamic data);

  Future<dynamic> putApiResponse(String url, dynamic data);

  Future<dynamic> deleteApiResponse(String url);
}
