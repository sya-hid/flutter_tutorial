import 'package:flutter/material.dart';

class MyClipPath extends StatefulWidget {
  final String? title;
  const MyClipPath({Key? key, this.title}) : super(key: key);

  @override
  State<MyClipPath> createState() => _MyClipPathState();
}

class _MyClipPathState extends State<MyClipPath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        // appBar: AppBar(
        //   title: Text(widget.title!),
        // ),
        body: Column(
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fruits.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            ClipPath(
              clipper: ClipPathClass2(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/vegetable.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ));
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height - 70, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
