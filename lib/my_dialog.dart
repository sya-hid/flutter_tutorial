import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  final String? title;
  const MyDialog({Key? key, this.title}) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          constraints: const BoxConstraints(minHeight: 200),
                          child: const Text(
                              'This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView'),
                        ),
                      );
                    });
              },
              child: Text(widget.title!)),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Notification'),
                        actions: [
                          FlatButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('No')),
                          FlatButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Yes')),
                        ],
                      );
                    }).then((value) {
                  if (value == null) return;
                  if (value) {
                    print('yes');
                  } else {
                    print('no');
                  }
                });
              },
              child: const Text('Alert Dialog')),
          TextButton(
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'App Name',
                    applicationVersion: '1.0',
                    applicationLegalese: 'App Description',
                    applicationIcon: Image.asset(
                      'assets/images/banana.jpg',
                      width: 50,
                      height: 50,
                    ));
              },
              child: const Text('About Dialog'))
        ],
      )),
    );
  }
}
