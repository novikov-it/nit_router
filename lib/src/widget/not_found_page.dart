import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPageWidget extends StatefulWidget {
  const NotFoundPageWidget({
    super.key,
    required this.redirectPath,
  });

  final String redirectPath;

  @override
  State<NotFoundPageWidget> createState() => _NotFoundPageWidgetState();
}

class _NotFoundPageWidgetState extends State<NotFoundPageWidget> {
  Timer? timer;
  int counter = -1;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer(
      const Duration(seconds: 1),
      () {
        if (counter == -1) {
          setState(() {
            counter = 3;
          });
        } else if (counter > 0) {
          setState(() {
            counter--;
          });
        } else if (counter == 0) {
          context.go(widget.redirectPath);
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Страница не найдена'),
            if (counter != -1) Text('$counter'),
            IconButton(
              onPressed: () {
                context.go(widget.redirectPath);
              },
              icon: const Icon(Icons.reply),
            ),
          ],
        ),
      ),
    );
  }
}
