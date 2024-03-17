// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hkorn_new_dev_vijay/const/variables.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';

class AuthRepo<T> {
  late Response _response;
  final _dio = Dio();

  Future<T?> postRequestForLogin(
      {required final String email, required final String password}) async {
    Map<String, dynamic> formDataMap = {
      'username': email,
      'password': password,
    };
    FormData formData = FormData.fromMap(formDataMap);
    logger.d(formData);
    _response = await _dio.post(baseUrl + 'login', data: formData);
    logger.d(_response.statusCode);
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      logger.d(_response);
      logger.d(_response.statusCode);
      // throw Exception('Failed to post ');
      return null;
    }
  }

  Future<T> postRequest(
      {required bool requiresAuth,
      required String url,
      dynamic serializer,
      String keyWord = '',
      required Map<String, dynamic> data}) async {
    FormData formData = FormData.fromMap(data);

    Response response = await _dio.post(baseUrl + url, data: formData);

    if (response.statusCode == 200) {
      logger.d(response.data);
      if (keyWord.isEmpty) {
        return response.data;
      } else if (response.data["search_data"] == "No record found.") {
        response.data = [];
        return response.data;
      } else {
        return serializer != null
            ? serializer(response.data[keyWord])
            : response.data[keyWord];
      }
    } else {
      throw Exception('Failed to post ');
    }
  }

  Future<T> postRequestWithBody(
      {required bool requiresAuth,
      required String url,
      dynamic serializer,
      required Map data}) async {
    final Response response = await _dio.post(baseUrl + url, data: data);
    if (response.statusCode == 200) {
      return serializer != null
          ? serializer(response.data)
          : json.decode(response.data);
    } else {
      throw Exception('Failed to post ');
    }
  }

  Future<void> getRequest({
    required bool requiresAuth,
    required String url,
    required String keyword,
    dynamic serializer,
  }) async {
    try {
      logger.d('message');

      final Response response = await _dio.get(
        baseUrl + url,
      );
      logger.d(response.data);
      if (response.statusCode == 200) {
        logger.d(response);
        if (keyword.isEmpty) {
          logger.d(serializer != null);
          return serializer != null
              ? serializer(json.decode(response.data))
              : json.decode(response.data);
        } else {
          logger.d(serializer != null);
          return serializer != null
              ? serializer(json.decode(response.data[keyword]))
              : json.decode(response.data);
        }
      } else {
        throw Exception('Failed to post ');
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<List<T>?> getRequestForList({
    required bool requiresAuth,
    required String url,
    required String keyword,
    dynamic serializer,
  }) async {
    try {
      logger.d('message');
      final Response response = await _dio.get(
        baseUrl + url,
      );
      logger.d(response.data);
      if (response.statusCode == 200) {
        if (keyword.isEmpty) {
          List<dynamic> data = json.decode(response.data);
          logger.d(data);
          List<T>? serializedData = [];
          for (var element in data) {
            serializedData.add(serializer(element));
          }
          return serializedData;
        }
        // logger.d(response.data[keyword]);
        if (response.data['popup_data'] == 'No popup found.') {
          return [];
        } else {
          List<dynamic> data = response.data[keyword];
          logger.d(data);
          List<T>? serializedData = [];
          for (var element in data) {
            serializedData.add(serializer(element));
          }
          return serializedData;
        }
      } else {
        throw Exception('Failed to post ');
      }
    } catch (e) {
      logger.d(baseUrl + url);
      logger.d(e);
    }
  }

  void updateRequest() {}
}
