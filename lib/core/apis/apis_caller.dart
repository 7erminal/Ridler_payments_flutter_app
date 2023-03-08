import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:payments/index.dart';

class ApisCaller {
  ApisCaller._() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60), // 60 seconds
        receiveTimeout: Duration(seconds: 60), // 60 seconds
      ),
    );
  }

  static final instance = ApisCaller._();

  late Dio dio;

  // get data from api
  Future<T> getData<T>({
    required String path,
    Map<String, String>? queryParameters,
    required T Function(dynamic data) builder,
  }) async {
    try {
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      return builder(response.data);
    } catch (e) {
      // debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      final failure = ServerFailure(message: errorMessage);
      return builder(failure);
    }
  }

  // post data to api
  Future<T> postData<T>({
    required String path,
    dynamic? queryParameters,
    Map<String, dynamic>? body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      // print("params are ... ");
      // print(body.);
      Response response = await dio.post(
        // options: Options(headers: {
        //   HttpHeaders.contentTypeHeader: "application/json",
        // }),
        path,
        // data: queryParameters,
        data: queryParameters == null ? body : queryParameters,
      );
      return builder(response.data);
    } catch (e) {
      // debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      final failure = ServerFailure(message: errorMessage);
      return builder(failure);
    }
  }

  // put data to api
  Future<T> putData<T>({
    required String path,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      Response response = await dio.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return builder(response.data);
    } catch (e) {
      // debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      final failure = ServerFailure(message: errorMessage);
      return builder(failure);
    }
  }

  // patch data to api
  Future<T> patchData<T>({
    required String path,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      Response response = await dio.patch(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return builder(response.data);
    } catch (e) {
      // debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      final failure = ServerFailure(message: errorMessage);
      return builder(failure);
    }
  }

  // delete data from api
  Future<T> deleteData<T>({
    required String path,
    Map<String, String>? queryParameters,
    required T Function(dynamic data) builder,
  }) async {
    try {
      Response response = await dio.delete(
        path,
        queryParameters: queryParameters,
      );
      return builder(response.data);
    } catch (e) {
      // debugPrint(e.toString());
      final errorMessage = Exceptions.errorMessage(e);
      final failure = ServerFailure(message: errorMessage);
      return builder(failure);
    }
  }
}