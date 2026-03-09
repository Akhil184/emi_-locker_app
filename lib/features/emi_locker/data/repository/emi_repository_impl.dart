import 'package:dio/dio.dart';
import '../../../../core/api/api_service.dart';
import '../models/emi_status_model.dart';

class EmiRepositoryImpl {

  final ApiService apiService;

  EmiRepositoryImpl(this.apiService);

  Future<List<EmiStatusModel>> getEmiStatus(String userId, String token) async {

    Response response = await apiService.getEmiStatus(userId, token);

    final data = response.data;

    List list = data["data"] ?? [];

    return list.map((e) => EmiStatusModel.fromJson(e)).toList();
  }
}