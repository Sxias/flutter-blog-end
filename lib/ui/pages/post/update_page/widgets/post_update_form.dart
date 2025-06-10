import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_vm.dart';
import 'package:flutter_blog/ui/pages/post/update_page/post_update_fm.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostUpdateForm extends ConsumerWidget {
  Post post;

  PostUpdateForm(this.post);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostUpdateFM fm = ref.read(postUpdateProvider.notifier);
    PostUpdateModel model = ref.watch(postUpdateProvider);
    PostDetailVM vm = ref.read(postDetailProvider(post.id).notifier);

    return Form(
      child: ListView(
        children: [
          CustomTextFormField(
            hint: "Title",
            initialValue: post.title,
            onChanged: (value) {
              fm.title(value);
            },
          ),
          const SizedBox(height: smallGap),
          CustomTextArea(
            hint: "Content",
            initialValue: post.content,
            onChanged: (value) {
              fm.content(value);
            },
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: "글 수정하기",
            click: () {
              vm.update(post.id, model.title, model.content);
            },
          ),
        ],
      ),
    );
  }
}
