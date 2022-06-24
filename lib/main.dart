import 'package:flutter/material.dart';
import 'package:flutter_tutorial/my_carousel.dart';
import 'package:flutter_tutorial/my_carousel2item.dart';
import 'package:flutter_tutorial/my_custom_carousel.dart';
import 'package:flutter_tutorial/my_custom_pageview.dart';
import 'package:flutter_tutorial/my_listview.dart';
import 'package:flutter_tutorial/my_pageview.dart';
import 'package:flutter_tutorial/my_percent_indicator.dart';
import 'package:flutter_tutorial/my_scrollview.dart';

void main() {
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
        '/percent_indicator': (context) =>
            const MyPercentIndicator(title: 'Percent Indicator'),
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
            )
          ],
        ));
  }
}
