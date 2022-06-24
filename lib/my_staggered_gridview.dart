import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tutorial/models/item_model.dart';

class MyStaggeredGridview extends StatefulWidget {
  final String? title;
  const MyStaggeredGridview({Key? key, required this.title}) : super(key: key);

  @override
  State<MyStaggeredGridview> createState() => _MyStaggeredGridviewState();
}

class _MyStaggeredGridviewState extends State<MyStaggeredGridview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemCount: dataItem.length,
            itemBuilder: (context, index) {
              return Container(
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
                        fit: BoxFit.fitHeight)),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1.6);
            }));
  }
}
