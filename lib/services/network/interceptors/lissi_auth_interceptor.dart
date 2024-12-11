import 'dart:io';

import 'package:dio/dio.dart';
import 'package:municipium/repositories/lissi_repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio dio;
  final LissiRepository lissiRepository;
  AuthInterceptor({required this.lissiRepository, required this.dio});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await lissiRepository.getLissiTokenKeyFromStorage();
    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
