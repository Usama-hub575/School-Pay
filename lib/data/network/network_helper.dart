import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/export.dart';

abstract class NetworkHelper {
  Future<Either<String, Failure>> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<Either<String, Failure>> post(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
  });

  Future<Either<String, Failure>> multipart(
    String url, {
    Map<String, String>? headers,
    body,
    files,
  });

  Future<Either<String, Failure>> delete(
    String url, {
    Map<String, String>? headers,
  });

  Future<Either<String, Failure>> put(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
  });

  Map<String, String> appendHeader({
    Map<String, String>? headers,
  });

  Either<String, Failure> handleResponse({
    http.Response response,
  });
}
