import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/controller/post_controller.dart';
import 'package:social_media_app/themes.dart';
import 'package:social_media_app/widgets/profile_post.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();
    var random = Random();

    Widget header() {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 230,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff1DB3C4),
                  Color(0xff260D51),
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(
                  top: 30,
                  right: 20,
                ),
                child: Icon(
                  Icons.settings_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -16,
            right: 0,
            left: 0,
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/image_profile.jpg',
                    ),
                    radius: 40,
                  ),
                  SizedBox(height: 5),
                  Text(
                  'lubiancaa',
                    style: poppins.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(
                      left: 80,
                      right: 80,
                    ),
                    child: Text(
                      'I really like flutter it\'s amazing, very simple and effective',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(
                        color: Colors.white,
                        fontWeight: light,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: poppins.copyWith(
                          color: bgColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget statistic() {
      Widget statisticWidget({total, menu}) {
        return Container(
          width: 70,
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                total,
                style: poppins.copyWith(
                  color: Colors.white,
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
              Text(
                menu,
                style: poppins.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            statisticWidget(total: '${postController.postList.length}', menu: 'Post'),
            statisticWidget(total: '589', menu: 'Followers'),
            statisticWidget(total: '641', menu: 'Following'),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: 85 / 100,
          children: postController.postList
              .map(
                (item) => ProfilePost(
                  imagePost: item.imageGallery,
                  category: Icons.image,
                ),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          header(),
          statistic(),
          content(),
        ],
      ),
    );
  }
}
