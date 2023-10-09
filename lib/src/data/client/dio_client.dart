import 'dart:developer';
import 'package:arquitetura_mvc/src/data/client/rest_client_interface.dart';
import 'package:dio/dio.dart';

class DioClient implements IRestClient {
  final Dio _dio = Dio();

  BaseOptions options = BaseOptions(
    headers: {
      'Content-Type': 'application/json',
    },
  );

  @override
  Future getData({required String url}) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }
}
