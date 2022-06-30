import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/item_model.dart';

class MyCarouselIndicator extends StatefulWidget {
  final String? title;
  const MyCarouselIndicator({Key? key, this.title}) : super(key: key);

  @override
  State<MyCarouselIndicator> createState() => _MyCarouselIndicatorState();
}

class _MyCarouselIndicatorState extends State<MyCarouselIndicator> {
  int currentImage = 0;
  Widget indicator(int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: currentImage == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentImage == index
              ? Colors.deepPurple
              : Colors.deepPurpleAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
                itemCount: dataItem.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(3, 3),
                              spreadRadius: 3,
                              blurRadius: 3,
                              color: Colors.black54)
                        ],
                        image: DecorationImage(
                            image: AssetImage(dataItem[index].image!),
                            fit: BoxFit.cover)),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(dataItem.length, (index) {
                return indicator(index);
              }),
            )
          ],
        ));
  }
}
