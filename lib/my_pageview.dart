import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  final String? title;
  const MyPageView({Key? key, this.title}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
    );
  }
}
