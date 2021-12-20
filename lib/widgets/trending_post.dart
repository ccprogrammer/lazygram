import 'package:flutter/material.dart';
import 'package:social_media_app/themes.dart';

class TrendingPost extends StatelessWidget {
  final String username;
  final String postTrending;
  final String userImage;
  final int likes;

  TrendingPost({
    required this.username,
    required this.postTrending,
    required this.userImage,
    required this.likes,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 187,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(postTrending),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            bottom: 10,
            right: 10,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(userImage),
                radius: 15,
              ),
              SizedBox(width: 5),
              Text(
                username,
                style: poppins.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                '${likes}',
                style: poppins.copyWith(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
