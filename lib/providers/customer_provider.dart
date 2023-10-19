import 'package:dio/dio.dart';
import 'package:test_tirtakencana/models/customer.dart';

class CustomerProvider {
  late Dio _dio;
  String baseUrl = 'http://127.0.0.1/api-test-tirtakencana/public/api';

  CustomerProvider(){
    _dio = Dio();
  }

  Future<CustomerModel> getAll() async{
    var response = await _dio.get(
      '$baseUrl/customers',
      options: Options(
        headers: {
          "Content-Type": "application/json",
        }
      )
    );

    return CustomerModel.fromJson(response.data);
  }
}