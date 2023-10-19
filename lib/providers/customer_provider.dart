import 'package:dio/dio.dart';
import 'package:test_tirtakencana/models/customer.dart';

class CustomerProvider {
  late Dio _dio;
  String baseUrl = 'http://10.0.2.2/api-test-tirtakencana/public/api';

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

  Future<void> updateSuccess(String tanggal, String id) async{
    try {
      var response = await _dio.put(
        '$baseUrl/updateterima/$id',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          }
        ),
        data: {
          "receiveddate": tanggal
        },
      );
      
      print(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  Future<void> updateFail(String alasan, String id) async{
    

    try {
      await _dio.put(
        '$baseUrl/updatetolak/$id',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          }
        ),
        data: {
          "failedreason": alasan
        },
      );
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}