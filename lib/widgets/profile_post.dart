import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/controller/post_controller.dart';
import 'package:social_media_app/themes.dart';

class ProfilePost extends StatelessWidget {
  final String imagePost;
  IconData category;

  ProfilePost({
    required this.imagePost,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();

    return Container(
      height: 112,
      width: 85,
      decoration: BoxDecoration(
        image: postController.selectedImagePath == ''
            ? DecorationImage(
                image: NetworkImage(imagePost),
                fit: BoxFit.cover,
              )
            : DecorationImage(
                image: FileImage(File(imagePost)),
                fit: BoxFit.cover,
              ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              Icon(
                category,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
