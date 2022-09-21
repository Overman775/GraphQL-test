import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class HttpCompressAdapter implements HttpClientAdapter {
  final HttpClientAdapter client;

  const HttpCompressAdapter(this.client);

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<Object?>? cancelFuture,
  ) async {
    _setAcceptHeaders(options);

    final result = await client.fetch(
      options,
      requestStream,
      cancelFuture,
    );

    return _decompressResponse(result);
  }

  @override
  void close({bool force = false}) {
    client.close(force: force);
  }

  ResponseBody _decompressResponse(ResponseBody response) {
    final headerCodec = response.headers['content-encoding']?.first;

    if (headerCodec == 'gzip') {
      response.stream = _decompressGzipBytes(response.stream);
    }

    return response;
  }

  Stream<Uint8List> _decompressGzipBytes(Stream<Uint8List> streamResult) =>
      streamResult.cast<List<int>>().transform(gzip.decoder).cast<Uint8List>();

  void _setAcceptHeaders(RequestOptions options) {
    options.headers['accept-encoding'] = 'gzip';
  }
}
