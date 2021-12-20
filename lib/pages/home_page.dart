import 'package:flutter/material.dart';
import 'package:social_media_app/pages/home_tabs/trending_tab.dart';
import 'package:social_media_app/themes.dart';
import 'home_tabs/following_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> myTabs = [
      Tab(
        text: 'Following',
      ),
      Tab(
        text: 'Trending',
      ),
    ];

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: bgColor,
        // APPBAR
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 60,
          // BOTTOM
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 20),
                labelColor: Colors.white,
                labelStyle: poppins.copyWith(
                  fontSize: 15,
                  fontWeight: bold,
                ),
                unselectedLabelColor: Color(0xff585861),
                indicatorColor: Colors.white.withOpacity(0),
                indicatorSize: TabBarIndicatorSize.label,
                // TABS
                tabs: myTabs,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FollowingTab(),
            TrendingTab(),
          ],
        ),
      ),
    );
  }
}
