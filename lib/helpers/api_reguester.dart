import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'error_helper.dart';

class APIRequester {
  APIRequester({
    this.baseUrl,
  });
  String? baseUrl;

  late final baseOptions = BaseOptions(
    baseUrl: baseUrl ?? "https://api.openweathermap.org/",
    headers: {},
    responseType: ResponseType.json,
    contentType: 'application/json; charset=utf-8',
    connectTimeout: 10000,
    receiveTimeout: 35000,
  );

  Dio _init() => Dio(
        baseOptions,
      );

  // Future<dynamic> getPreferences(String key) async {
  //   final preferences = await SharedPreferences.getInstance();
  //   return preferences.get(key);
  // }

  ErrorsEnum catchError(error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.response: //RESPONSE
          {
            debugPrint(
                '===================> error.response <===================');
            debugPrint(error.response.toString());

            if (error.response!.statusCode == 401) {
              log("message");

              return ErrorsEnum.invalidError;
            } else if (error.response!.statusCode == 429) {
              log(json.decode(error.response!.data)['message']);

              log(json.decode(error.response!.data)['errorDescription']);
              log("statusCode");
              return ErrorsEnum.invalidError;
            } else if (error.response!.statusCode == 422) {
              if (error.response
                  .toString()
                  .contains("Такого города не существует")) {
                return ErrorsEnum.citynotfound;
              }
            }
            // ignore: lines_longer_than_80_chars

            return ErrorsEnum.invalidError;
          }
        case DioErrorType.receiveTimeout: //RECEIVE_TIMEOUT
        case DioErrorType.connectTimeout:
          {
            return ErrorsEnum.noInternetConnectionError;
          }
        case DioErrorType.sendTimeout: //SEND_TIMEOUT
          {
            return ErrorsEnum.connectionTimeOut;
          }
        case DioErrorType.other:
          {
            log("message2");
            log(error.message.toString());
            if (error.message.contains("SoketException")) {
              return ErrorsEnum.noInternetConnectionError;
            }
            return ErrorsEnum.invalidError;
          }
        case DioErrorType.cancel: //CANCEL
          {
            return ErrorsEnum.responceCancel;
          }
        default:
          {
            return ErrorsEnum.systemError;
          }
      }
    } else {
      debugPrint(error.toString());
      return ErrorsEnum.systemError;
    }
  }

  Future<Response> toGet(
    String url, {
    Map<String, dynamic>? dataParam,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.get(url, queryParameters: dataParam, options: options);
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toPost(
    String url, {
    dynamic dataParam,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.post(url, data: dataParam, options: options);
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toPostParamDynamic(
    String url, {
    dynamic dataParam,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.post(url, data: dataParam.toString());
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toPut(
    String url, {
    dynamic dataParam,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.put(url, data: dataParam);
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toDelete(
    String url, {
    Map<String, dynamic>? dataParam,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.delete(url, data: dataParam);
    } catch (error) {
      throw catchError(error);
    }
  }
}
