import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/item_model.dart';

class MyPageView extends StatefulWidget {
  final String? title;
  const MyPageView({Key? key, this.title}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
    body: PageView(
      controller: controller,
      children: List.generate(dataItem.length, (index) => PageViewItem(data: dataItem[index],)),
    )
    );
  }
}
class PageViewItem extends StatelessWidget {
  final ItemModel? data;
  const PageViewItem({ Key? key, this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(data!.image!),fit: BoxFit.cover,)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data!.title!,style: const TextStyle(fontSize: 20,color: Colors.white,backgroundColor: Colors.black54,),),
          Text(data!.subtitle!,style: const TextStyle(fontSize: 16,color: Colors.white,backgroundColor: Colors.black54,),),
        ],
      ),
    );
  }
}
