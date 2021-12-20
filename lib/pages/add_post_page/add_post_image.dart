import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/controller/post_controller.dart';
import 'package:social_media_app/pages/main_page.dart';
import 'package:social_media_app/themes.dart';
import 'package:get/get.dart';
import 'package:social_media_app/widgets/gallery_picker.dart';
import 'dart:io';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();

    Widget imageShow() {
      return Obx(
        () => Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: postController.selectedImagePath.value != ''
                ? DecorationImage(
                    image: FileImage(
                      File(postController.selectedImagePath.value),
                    ),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: NetworkImage(
                      postController.galleryC.value,
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      );
    }

    Widget imagePick() {
      return Container(
        color: bgColor,
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                postController.getImage(ImageSource.camera);
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Take a Photo',
                      style: poppins.copyWith(
                        fontWeight: semibold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                postController.getImage(ImageSource.gallery);
              },
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.image,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Another Gallery',
                      style: poppins.copyWith(
                        fontWeight: semibold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget gallery() {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          // physics: NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          children: postController.galleryList
              .map(
                (item) => GestureDetector(
                  onTap: () {
                    postController.chooseImage(item);
                  },
                  child: GalleryPicker(
                    imageUrl: item,
                  ),
                ),
              )
              .toList(),
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
          icon: Icon(Icons.cancel_outlined, size: 30),
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
              postController.addPost(postController);
              Get.to(() => MainPage());
            },
            icon: Icon(Icons.arrow_forward, size: 30),
          )
        ],
      ),
      body: Column(
        children: [
          imageShow(),
          imagePick(),
          gallery(),
        ],
      ),
    );
  }
}
