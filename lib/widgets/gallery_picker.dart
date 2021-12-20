import 'package:flutter/material.dart';

class GalleryPicker extends StatelessWidget {
  String imageUrl;

  GalleryPicker({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
