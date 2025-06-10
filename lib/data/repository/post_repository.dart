import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:logger/logger.dart';

class PostRepository {
  Future<Map<String, dynamic>> getList({int page = 0}) async {
    Response response = await dio.get("/api/post", queryParameters: {"page": page});
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> getOne(int postId) async {
    Response response = await dio.get("/api/post/${postId}");
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> deleteOne(int postId) async {
    Response response = await dio.delete("/api/post/${postId}");
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> write(String title, String content) async {
    // 1. Map 변환
    final requestBody = {
      "title": title,
      "content": content,
    };

    // 2. 통신
    Response response = await dio.post("/api/post", data: requestBody);
    Map<String, dynamic> responseBody = response.data;

    return responseBody;
  }

  Future<Map<String, dynamic>> update(int postId, String title, String content) async {
    // 1. Map 변환
    final requestBody = {
      "title": title,
      "content": content,
    };

    // 2. 통신
    Response response = await dio.put("/api/post/${postId}", data: requestBody);
    Map<String, dynamic> responseBody = response.data;

    return responseBody;
  }
}
