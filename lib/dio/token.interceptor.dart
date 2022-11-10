import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/providers/providers.dart';

class TokenInterceptor extends Interceptor {
  final Reader reader;

  TokenInterceptor(this.reader);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var authValue = reader(authProvider);
    var token = authValue.value!.accessToken;

    options.headers.update(
      'Authorization',
      (value) => 'Bearer $token',
      ifAbsent: () => 'Bearer $token',
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
