import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/item_model.dart';

class MyReorderList extends StatefulWidget {
  final String? title;
  const MyReorderList({Key? key, this.title}) : super(key: key);

  @override
  State<MyReorderList> createState() => _MyReorderListState();
}

class _MyReorderListState extends State<MyReorderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: ReorderableListView(
            children: dataItem.map((e) {
              return ListTile(
                key: ValueKey(e),
                title: Text(e.title!),
                subtitle: Text(e.subtitle!),
              );
            }).toList(),
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex--;
                final item = dataItem.removeAt(oldIndex);
                dataItem.insert(newIndex, item);
              });
            }));
  }
}
