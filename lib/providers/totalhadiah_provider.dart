import 'package:dio/dio.dart';
import 'package:test_tirtakencana/models/totalhadiah.dart';

class TotalHadiahProvider {
  late Dio _dio;
  String baseUrl = 'http://10.0.2.2/api-test-tirtakencana/public/api';

  TotalHadiahProvider(){
    _dio = Dio();
  }

  Future<TotalHadiah> getAll() async{
    var response = await _dio.get(
      '$baseUrl/totalhadiah',
      options: Options(
        headers: {
          "Content-Type": "application/json",
        }
      )
    );

    return TotalHadiah.fromJson(response.data);
  }
}