import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/controller/post_controller.dart';
import 'package:social_media_app/widgets/following_post.dart';
import 'dart:math';

class FollowingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postController = Get.put(PostController());
    var random = Random();

    return Obx(
      () => SingleChildScrollView(
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: postController.postList
              .map(
                (item) => FollowingPost(
                  imagePost: item.imageGallery,
                  imageUser: 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
                  username: 'CCP',
                  likes: random.nextInt(1000),
                  comments: random.nextInt(50),
                  downloads: random.nextInt(100),
                  followers: 588,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
