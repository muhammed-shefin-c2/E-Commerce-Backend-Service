import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:commerce_js_mobile_app/Models/Product_Models.dart';

class ProductRepository {
  final String apiUrl = 'http://feuwtwlbyegspbhhgoiy.supabase.co/rest/v1/ecommersce';
  final String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZldXd0d2xieWVnc3BiaGhnb2l5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY3MTE0MTAsImV4cCI6MjA1MjI4NzQxMH0.WUDiTcAmYn7espIuek3pqCmrOJuHyImdNI83XRF7bbw';

  Future<List<ProductModels>> getProducts() async {
    final response = await http.get(
        Uri.parse(apiUrl),
      headers: {
          'apikey' : apiKey,
        'Authorization' : apiKey
      }
    );

    if (response.statusCode == 200) {
      final productData = jsonDecode(response.body) as List<dynamic>;

      return productData.map((json) => ProductModels.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
