import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none),
      ),
    );
  }
}
