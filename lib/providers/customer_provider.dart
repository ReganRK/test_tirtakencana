import 'package:flutter/material.dart';
import 'package:test_tirtakencana/models/customer.dart';
import 'package:http/http.dart' as http;

class CustomerProvider extends ChangeNotifier{
  static const apiEndPoint = 'http://127.0.0.1/api-test-tirtakencana/public/api';

  bool isLoading = true;
  String error = '';
  Customer customer = Customer(data: []);

  getData() async{
    try {
      var url = Uri.https(apiEndPoint, '/customers');
      var response = await http.post(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        customer = customerFromJson(response.body);
      }
      else{
        error = 'Sumthing wong';
      }

    } catch (e) {
      print(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}