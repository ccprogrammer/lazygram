import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_app/pages/add_post_page/add_post_image.dart';
import 'package:social_media_app/pages/home_page.dart';
import 'package:social_media_app/pages/profile_page.dart';
import 'package:social_media_app/themes.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final _currentIndexNav = 0.obs;
  final screens = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Obx(
          () => BottomNavigationBar(
            onTap: (value) {
              _currentIndexNav.value = value;
              print(value);
            },
            currentIndex: _currentIndexNav.value,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_home.png',
                  width: 20,
                  color: _currentIndexNav == 0 ? navColor : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_profile.png',
                  width: 20,
                  color: _currentIndexNav == 1 ? navColor : Colors.white,
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget floatingActionButton() {
      return Container(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Container(
          width: 48,
          height: 48,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 2,
            onPressed: () {
              Get.to(() => AddPost());
            },
            child: Icon(
              Icons.add,
              color: Color(0xffFF5B58),
              size: 28,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: bgColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: bgColor,
            // LAYAR
            child: Obx(
              () => screens[_currentIndexNav.value],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: customBottomNav(),
            ),
          ),
        ],
      ),
    );
  }
}
