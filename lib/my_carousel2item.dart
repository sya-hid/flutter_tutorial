import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/item_model.dart';
class MyCarousel2Item extends StatefulWidget {
  const MyCarousel2Item({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<MyCarousel2Item> createState() => _MyCarousel2ItemState();
}

class _MyCarousel2ItemState extends State<MyCarousel2Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: (dataItem.length / 2).round(),
          itemBuilder: (context, index, realIndex) {
            final first = index * 2;
            int? second = 0;
            dataItem.length.isOdd
                ? second =
                    index < ((dataItem.length / 2).round() - 1) ? first + 1 : 0
                : second = index < ((dataItem.length / 2).round() - 0)
                    ? first + 1
                    : null;
            return Row(
              children: [first, second].map((e) {
                return e != null
                    ? Expanded(child: CarouselItem(data: dataItem[e]))
                    : Expanded(child: Container());
              }).toList(),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 2,
          ),
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final ItemModel? data;
  const CarouselItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(data!.image!),
              fit: BoxFit.cover,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                data!.title!,
                style: const TextStyle(
                    backgroundColor: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                data!.subtitle!,
                style: const TextStyle(
                    backgroundColor: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}