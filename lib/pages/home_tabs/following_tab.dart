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
                  imageUser: 'assets/image_profile.jpg',
                  username: 'lubiancaa',
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
