import 'package:flutter/material.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
