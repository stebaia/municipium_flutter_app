import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

class EcoattiviInterceptor extends QueuedInterceptor {
  final EcoattiviRepository repository;
  final Dio dio;
  BuildContext context;
  EcoattiviInterceptor(
      {required this.repository, required this.context, required this.dio});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["accept"] = '*/*';

    final token = await repository.getToken;
    //options.headers["x_usr_token"] = token;
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    print(err);

    super.onError(err, handler);
  }
}
