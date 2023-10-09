import 'package:arquitetura_mvc/src/data/client/custom_exception.dart';
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
      throw CustomException(error: e);
    }
  }

  @override
  Future postData(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      await _dio.post(
        url,
        data: data,
      );
    } catch (e) {
      throw CustomException(error: e);
    }
  }

  @override
  Future deleteData({required String url}) async {
    try {
      await _dio.delete(url);
    } catch (e) {
      throw CustomException(error: e);
    }
  }
}
