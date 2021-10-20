import 'package:dio/dio.dart';

var dio = Dio();
Future<int> suma(int numero1, int numero2) async {
  // Optionally the request above could also be done as
  final data = {"numero1": numero1, "numero2": numero2};
  final response =
      await dio.post('http://192.168.0.6:3000/sumador', data: data);

  return response.data[0]['resultado'];
}
