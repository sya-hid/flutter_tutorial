import 'package:flutter/material.dart';
import 'package:flutter_tutorial/my_carousel.dart';
import 'package:flutter_tutorial/my_carousel2item.dart';
import 'package:flutter_tutorial/my_carousel_indicator.dart';
import 'package:flutter_tutorial/my_clippath.dart';
import 'package:flutter_tutorial/my_custom_carousel.dart';
import 'package:flutter_tutorial/my_custom_pageview.dart';
import 'package:flutter_tutorial/my_dialog.dart';
import 'package:flutter_tutorial/my_listview.dart';
import 'package:flutter_tutorial/my_navbottom.dart';
import 'package:flutter_tutorial/my_pageview.dart';
import 'package:flutter_tutorial/my_percent_indicator.dart';
import 'package:flutter_tutorial/my_reorder_listview.dart';
import 'package:flutter_tutorial/my_scrollview.dart';
import 'package:flutter_tutorial/my_sqflite.dart';
import 'package:flutter_tutorial/my_staggered_gridview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHomePage(title: 'My Tutorial'),
        '/listview': (context) => const MyListView(title: 'ListView'),
        '/carousel_slider': (context) =>
            const MyCarouselSlider(title: 'Carousel'),
        '/carousel_2item': (context) => const MyCarousel2Item(
              title: 'Carousel 2 Item',
            ),
        '/scrollview': (context) => const MyScrollview(
              title: 'ScrollView',
            ),
        '/custom_carousel': (context) =>
            const CustomCarousel(title: 'Custom Carousel'),
        '/pageview': (context) => const MyPageView(title: 'Pageview'),
        '/custom_pageview': (context) =>
            const MyCustomPageview(title: 'Custom Pageview'),
        '/staggered_gridview': (context) =>
            const MyStaggeredGridview(title: 'Staggered Gridview'),
        '/percent_indicator': (context) =>
            const MyPercentIndicator(title: 'Percent Indicator'),
        '/carousel_indicator': (context) => const MyCarouselIndicator(
              title: 'Carousel Indicator',
            ),
        '/bottom_nav': (context) => const MyNavBottom(
              title: 'Bottom Navigation',
            ),
        '/clippath': (context) => const MyClipPath(
              title: 'Clip Path',
            ),
        '/dialog': (context) => const MyDialog(
              title: 'Dialog',
            ),
        '/reorder_listview': (context) => const MyReorderList(
              title: 'Reorder Listview',
            ),
        '/sqflite': (context) => const MySqflite(
              title: 'Sqflite',
            ),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'My Flutter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          reverse: true,
          padding: const EdgeInsets.all(20),
          children: const [
            MenuItem(
              text: 'ListView',
              press: '/listview',
            ),
            MenuItem(
              text: 'Carousel',
              press: '/carousel_slider',
            ),
            MenuItem(
              text: 'Carousel 2 Item',
              press: '/carousel_2item',
            ),
            MenuItem(
              text: 'Scrollview',
              press: '/scrollview',
            ),
            MenuItem(
              text: 'Custom Carousel',
              press: '/custom_carousel',
            ),
            MenuItem(
              text: 'PageView',
              press: '/pageview',
            ),
            MenuItem(
              text: 'Custom PageView',
              press: '/custom_pageview',
            ),
            MenuItem(
              text: 'Staggered Gridvieww',
              press: '/staggered_gridview',
            ),
            MenuItem(
              text: 'Percent Indicator',
              press: '/percent_indicator',
            ),
            MenuItem(
              text: 'Carousel Indicator',
              press: '/carousel_indicator',
            ),
            MenuItem(
              text: 'Bottom Navigation',
              press: '/bottom_nav',
            ),
            MenuItem(
              text: 'ClipPath',
              press: '/clippath',
            ),
            MenuItem(
              text: 'Stepper',
              press: '/stepper',
            ),
            MenuItem(
              text: 'Dialog',
              press: '/dialog',
            ),
            MenuItem(
              text: 'Reorder Listview',
              press: '/reorder_listview',
            ),
            MenuItem(
              text: 'Sqflite',
              press: '/sqflite',
            ),
            MenuItem(
              text: 'Tes',
              press: '/sqflite',
            )
          ],
        ));
  }
}

class MenuItem extends StatelessWidget {
  final String? text;
  final String? press;
  const MenuItem({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, press!),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(3, 3),
                  blurRadius: 5,
                  spreadRadius: 3),
            ]),
        child: Row(
          children: [
            Text(
              text!,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
