import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_vm.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_buttons.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_content.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_profile.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  int postId;

  PostDetailBody(this.postId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NotifierProvider.family -> 매개변수는 괄호 안에 넣어서 전달
    PostDetailModel? model = ref.watch(postDetailProvider(postId));

    if (model == null)
      return Center(child: CircularProgressIndicator());
    else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PostDetailTitle(model.post.title),
            const SizedBox(height: largeGap),
            // user 정보 전달 (email은 생략 (response에서 미포함))
            PostDetailProfile(model.post),
            // 내가 글을 쓴 사람이면 (글의 userId == sessionGVM의 userId) 표시 (if 가능)
            PostDetailButtons(model.post),
            const Divider(),
            const SizedBox(height: largeGap),
            PostDetailContent(model.post.content),
          ],
        ),
      );
    }
  }
}
