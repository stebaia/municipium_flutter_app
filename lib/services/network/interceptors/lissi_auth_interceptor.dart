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
    if (options.uri.toString().contains('maggioli.municipiumapp.it')) {
      final token = await lissiRepository.getLissiTokenKeyFromStorage();
      if (token != null) {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }
    }

    handler.next(options);
  }
}
