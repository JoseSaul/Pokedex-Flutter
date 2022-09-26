import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    this.title = '',
    this.text = '',
  }) : super(key: key);

  final String title;
  final String text;


  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          children: [
            TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: text, style: const TextStyle(fontWeight: FontWeight.w300)),
          ]
        )
    );
  }
}