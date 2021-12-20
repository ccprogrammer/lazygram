import 'package:flutter/material.dart';
import 'package:social_media_app/themes.dart';
import 'package:social_media_app/widgets/trending_post.dart';
import 'dart:math';

class TrendingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _random = Random();

    Widget category({title, bool primary = false}) {
      return Container(
        height: 30,
        margin: EdgeInsets.only(right: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primary ? Colors.white : Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 12),
            side: BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text(
            '#${title}',
            style: poppins.copyWith(
              color: primary ? bgColor : Colors.white,
              fontWeight: bold,
              fontSize: 11,
            ),
          ),
        ),
      );
    }

    Widget categoriesList() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 20),
            category(title: 'popular', primary: true),
            category(title: 'Gaming', primary: false),
            category(title: 'Travel', primary: false),
            category(title: 'Food', primary: false),
            category(title: 'sports', primary: false),
            category(title: 'development', primary: false),
            category(title: 'anime', primary: false),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 187 / 240,
            children: [
              TrendingPost(
                username: 'james',
                postTrending:
                    'https://images.unsplash.com/photo-1551878931-9c07f24e9911?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                userImage:
                    'https://images.unsplash.com/photo-1454923634634-bd1614719a7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
              TrendingPost(
                username: 'alex999',
                postTrending:
                    'https://images.unsplash.com/photo-1584696049838-8e692282a2e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c3RyZWV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                userImage:
                    'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
              TrendingPost(
                username: 'amir_aja',
                postTrending:
                    'https://images.unsplash.com/photo-1494257610566-28280a243b22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHN0cmVldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                userImage:
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
              TrendingPost(
                username: 'konguan',
                postTrending:
                    'https://images.unsplash.com/photo-1581262177000-8139a463e531?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHN0cmVldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                userImage:
                    'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
              TrendingPost(
                username: 'james',
                postTrending:
                    'https://images.unsplash.com/photo-1598966835412-6de6f92c243d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                userImage:
                    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
              TrendingPost(
                username: 'alex999',
                postTrending:
                    'https://images.unsplash.com/photo-1583438861468-3b7963d64749?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHN0cmVldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                userImage:
                    'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
              TrendingPost(
                username: 'amir_aja',
                postTrending:
                    'https://images.unsplash.com/photo-1504861081541-e24d43143a08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHN0cmVldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                userImage:
                    'https://images.unsplash.com/photo-1492567291473-fe3dfc175b45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
              TrendingPost(
                username: 'konguan',
                postTrending:
                    'https://images.unsplash.com/photo-1500033963968-1151893623e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHN0cmVldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                userImage:
                    'https://images.unsplash.com/photo-1533227268428-f9ed0900fb3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                likes: _random.nextInt(1000),
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          categoriesList(),
          content(),
        ],
      ),
    );
  }
}
