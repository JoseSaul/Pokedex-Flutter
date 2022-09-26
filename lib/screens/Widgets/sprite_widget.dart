import 'package:flutter/material.dart';

class SpriteWidget extends StatelessWidget {
  const SpriteWidget({
    Key? key,
    required this.imageUrl
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        width: 100,
        height: 100,
        placeholder: const AssetImage('assets/Loading.gif') ,
        image: NetworkImage(imageUrl)
    );
  }
}
