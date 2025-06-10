// fm : Form Model, 전송할 데이터를 담는 Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// 1. 창고 관리자
final postUpdateProvider = NotifierProvider<PostUpdateFM, PostUpdateModel>(() {
  return PostUpdateFM();
});

/// 2. 창고
class PostUpdateFM extends Notifier<PostUpdateModel> {
  @override
  PostUpdateModel build() {
    return PostUpdateModel("", "");
  }

  void title(String title) {
    Logger().d("title : ${title}");
    state = state.copyWith(
      title: title,
    );
  }

  void content(String content) {
    Logger().d("content : ${content}");
    state = state.copyWith(
      content: content,
    );
  }
}

/// 3. 창고 데이터 타입
class PostUpdateModel {
  final String title;
  final String content;

  PostUpdateModel(
    this.title,
    this.content,
  );

  PostUpdateModel copyWith({
    String? title,
    String? content,
  }) {
    return PostUpdateModel(
      title ?? this.title,
      content ?? this.content,
    );
  }
}
