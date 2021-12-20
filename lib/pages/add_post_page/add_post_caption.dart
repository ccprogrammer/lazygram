import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/pages/main_page.dart';
import 'package:social_media_app/themes.dart';

class AddPostCaption extends StatelessWidget {
  const AddPostCaption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget captiion() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/image_person.jpg'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: poppins.copyWith(
                  color: Colors.white,
                  fontWeight: light,
                  fontSize: 13,
                ),
                decoration: InputDecoration(
                  hintText: 'Write a caption...',
                  hintStyle: poppins.copyWith(
                    color: Colors.white,
                    fontWeight: light,
                    fontSize: 13,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                'assets/image_post.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, size: 30),
        ),
        title: Text(
          'New post',
          style: poppins.copyWith(
            fontWeight: semibold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(MainPage());
            },
            icon: Icon(
              Icons.check,
              size: 30,
              color: Colors.lightBlue,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          captiion(),
          Divider(),
        ],
      ),
    );
  }
}
