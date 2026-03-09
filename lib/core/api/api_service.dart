import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiService {

  late Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  // LOGIN API
  Future<Response> login(String emailOrMobile, String password) async {
    return await dio.post(
      ApiConstants.login,
      data: {
        "emailOrMobile": emailOrMobile,
        "password": password,
      },
    );
  }

  // EMI STATUS API
  Future<Response> getEmiStatus(String userId, String token) async {
    return await dio.get(
      ApiConstants.emiStatus,
      queryParameters: {
        "userId": userId,
      },
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

  }
}