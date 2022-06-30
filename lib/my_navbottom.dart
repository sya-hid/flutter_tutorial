import 'package:flutter/material.dart';

class MyNavBottom extends StatefulWidget {
  final String? title;
  const MyNavBottom({Key? key, this.title}) : super(key: key);

  @override
  State<MyNavBottom> createState() => _MyNavBottomState();
}

class _MyNavBottomState extends State<MyNavBottom> {
  int currentPage = 0;

  Widget body() {
    switch (currentPage) {
      case 0:
        return const Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case 1:
        return const Center(
          child: Text(
            'Event',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            'Data',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case 3:
        return const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      default:
        return const Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: body(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (value) {
              setState(() {
                currentPage = value;
              });
            },
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_rounded), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.data_saver_off_rounded), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: ''),
            ]),
      ),
    );
  }
}
