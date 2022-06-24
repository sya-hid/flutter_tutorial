import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/item_model.dart';

class CustomCarousel extends StatefulWidget {
  final String? title;
  const CustomCarousel({Key? key, this.title}) : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _current = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: _current,
      viewportFraction: 0.75,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double pagee = 1.0;
          if (pageController.position.haveDimensions) {
            pagee = index.toDouble() - (pageController.page ?? 0);
            pagee = pagee * pagee;
          }
          return Transform.translate(
            offset: Offset(0, pagee * 80),
            child: previewFile(index),
          );
        });
  }

  Widget previewFile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dataItem[index].image!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 4,
                color: Colors.black54,
              )
            ],
            color: Colors.greenAccent),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataItem[index].title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            Text(
              dataItem[index].subtitle!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            )
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: PageView.builder(
          itemCount: dataItem.length,
          controller: pageController,
          allowImplicitScrolling: true,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return carouselView(index);
          },
        ),
      ),
    );
  }
}
