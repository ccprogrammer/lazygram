import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/controller/post_controller.dart';
import 'package:social_media_app/themes.dart';

class FollowingPost extends StatelessWidget {
  final String imagePost;
  final String imageUser;
  final String username;
  final int followers;
  final int likes;
  final int comments;
  final int downloads;

  FollowingPost({
    required this.imagePost,
    required this.imageUser,
    required this.username,
    required this.followers,
    required this.likes,
    required this.comments,
    required this.downloads,
  });

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();

    Widget action({iconUrl, total}) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Icon(
              iconUrl,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Text(
              total,
              style: poppins.copyWith(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.89,
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
      child: Stack(
        children: [
          // User name, etc.
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUser),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: poppins.copyWith(
                        fontSize: 13,
                        fontWeight: bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '${followers} Followers',
                      style: poppins.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Likes, Comments, Downloads
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: action(
                    iconUrl: Icons.favorite_border,
                    total: '${likes}',
                  ),
                ),
                action(
                  iconUrl: Icons.chat_bubble_outline,
                  total: '${comments}',
                ),
                action(
                  iconUrl: Icons.file_download,
                  total: '${downloads}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
