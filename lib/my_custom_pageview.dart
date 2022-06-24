import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/item_model.dart';

class MyCustomPageview extends StatefulWidget {
  final String? title;
  const MyCustomPageview({Key? key, this.title}) : super(key: key);

  @override
  State<MyCustomPageview> createState() => _MyCustomPageviewState();
}

class _MyCustomPageviewState extends State<MyCustomPageview> {
  PageController? controller;
  double viewPortFraction = 0.75;
  double? pageOffset = 0;
  @override
  void initState() {
    super.initState();
    controller =
        PageController(initialPage: 0, viewportFraction: viewPortFraction)
          ..addListener(() {
            setState(() {
              pageOffset = controller!.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: PageView.builder(
            controller: controller,
            itemCount: dataItem.length,
            itemBuilder: (context, index) {
              double scale = max(viewPortFraction,
                  (1 - (pageOffset! - index).abs() + viewPortFraction));
              double angle = (pageOffset! - index).abs();
              if (angle > 0.5) {
                angle = 1 - angle;
              }
              return Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 10,
                  bottom: 50,
                  top: 100 - scale * 25,
                ),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(3, 3),
                                color: Colors.black54,
                                spreadRadius: 5,
                                blurRadius: 5)
                          ],
                          image: DecorationImage(
                              image: AssetImage(dataItem[index].image!),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dataItem[index].title!,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                backgroundColor: Colors.black54),
                          ),
                          Text(
                            dataItem[index].subtitle!,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                backgroundColor: Colors.black54),
                          ),
                        ],
                      )),
                ),
              );
            }));
  }
}
