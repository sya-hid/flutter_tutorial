import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/item_model.dart';
class MyScrollview extends StatefulWidget {
  final String? title;
  const MyScrollview({Key? key, this.title}) : super(key: key);

  @override
  State<MyScrollview> createState() => _MyScrollviewState();
}

class _MyScrollviewState extends State<MyScrollview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurpleAccent,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      dataItem.length,
                      (index) => Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 20, right: 20)
                                : const EdgeInsets.only(right: 20),
                            child: Item(
                              data: dataItem[index],
                            ),
                          ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 240,
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                      dataItem.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Item(data: dataItem[index]),
                          ))),
            ),
          )
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final ItemModel? data;
  const Item({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent,
      ),
      height: 120,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(data!.image!), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data!.title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                data!.subtitle!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}